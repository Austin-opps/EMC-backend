class User < ApplicationRecord
  has_secure_password
 
  has_many :testimonials
  has_one :cart
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true

end
