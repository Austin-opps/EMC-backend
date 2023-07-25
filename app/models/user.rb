class User < ApplicationRecord
  has_many :testimonials
  has_many :products
end
