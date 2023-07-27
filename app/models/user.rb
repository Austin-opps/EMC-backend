class User < ApplicationRecord
  has_secure_password
 
  has_many :testimonials
  has_one :cart
end
