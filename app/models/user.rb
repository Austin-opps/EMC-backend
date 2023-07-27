class User < ApplicationRecord
  has_secure_password
 
  # has_many :testimonials
  # has_one :cart
  # has_one_attached :profile_picture # Add this line to enable profile picture attachment

end
