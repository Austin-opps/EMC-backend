class Product < ApplicationRecord
  # belongs_to :cart
  has_many :testimonials
  # belongs_to :admin  //the reson for comment is because with session we can check if admin then allow edit
end
