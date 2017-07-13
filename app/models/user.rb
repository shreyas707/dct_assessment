class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # THIS IS FOR USERS TO UPDATE ACCOUNT INFO (EXCEPT NEW PASSWORD) WITHOUT PROVIDING PASSWORD
  attr_accessor :current_password

  before_destroy :delete_user_from_qustion_sets, :delete_user_from_due_date_lists

  belongs_to :student #, dependent: :destroy

  acts_as_votable
  has_many :knowledge_bases
  has_many :answers #, dependent: :destroy
  has_many :comments #, dependent: :destroy
  has_many :question_sets
  has_many :solutions

  # for avatar upload (carrierwave and cloudinary)
  mount_uploader :avatar, AvatarUploader

  def is_admin?
    return true if self.role == "admin"
  end

  def is_student?
    return true if self.role == "student"
  end

  def active_for_authentication?
    super and self.is_active?
  end

  def inactive_message
    "You are not allowed to log in."
  end
  
  def delete_user_from_qustion_sets
    QuestionSet.all.each do |question_set|
      if question_set.user_ids.include?(self.id)
        question_set.user_ids = question_set.user_ids - [self.id]
        question_set.save
      end
    end
  end

  def delete_user_from_due_date_lists
    DueDateList.all.each do |due_date_list|
      if due_date_list.user_ids.include?(self.id)
        due_date_list.user_ids = due_date_list.user_ids - [self.id]
        due_date_list.save
      end
    end
  end

  def name_with_difficulty_level
    self.name + " - " + self.difficulty_level
  end

  def active_users
    User.where(is_active: true)
  end

end