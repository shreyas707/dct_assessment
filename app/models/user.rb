class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # THIS IS FOR USERS TO UPDATE ACCOUNT INFO (EXCEPT NEW PASSWORD) WITHOUT PROVIDING PASSWORD
  attr_accessor :current_password

  belongs_to :student  #, dependent: :destroy

  has_many :answers  #, dependent: :destroy
  has_many :comments  #, dependent: :destroy
  has_many :question_sets

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
  
end