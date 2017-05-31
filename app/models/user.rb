class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :student  #, dependent: :destroy
  acts_as_votable
  has_many :answers  #, dependent: :destroy
  has_many :comments  #, dependent: :destroy

  has_many :knowledge_bases

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
  
  # before_save :update_student

  # private
  # def update_student
  #   student = Student.find_by(email: self.email)
  #   student.name = self.name
  #   student.email = self.email
  #   student.save
  # end

end