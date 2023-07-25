class Product < ApplicationRecord
  belongs_to :admin
  has_many :users
  has_many :testimonials, through: :users
end
