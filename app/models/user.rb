class User < ApplicationRecord
<<<<<<< HEAD
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user]
  has_secure_password
  has_many :testimonials
  has_one :cart
  has_many :products, through: :cart
=======
  has_secure_password
  # has_many :model, :dependent => :delete_all 
 
  has_many :testimonials
  has_one :cart
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true

>>>>>>> 17957bc47dea580f8bcecb60e6e817f87a723c2c
end
