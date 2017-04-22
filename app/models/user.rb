class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :student

  has_many :answers

  validates_presence_of :email, :password

  def is_admin?
    return true if self.role == "admin"
  end

  def is_student?
    return true if self.role == "student"
  end

end