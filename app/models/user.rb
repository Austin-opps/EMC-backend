class User < ApplicationRecord
  has_many :testimonials
  has_many :products
  has_secure_password
  has_one_attached :profile_picture # Add this line to enable profile picture attachment
end
