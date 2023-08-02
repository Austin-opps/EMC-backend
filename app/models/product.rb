class Product < ApplicationRecord

  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :testimonials
  belongs_to :admin

end
