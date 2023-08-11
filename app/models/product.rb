class Product < ApplicationRecord
  # has_many :testimonials, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :galleryThumbnails, dependent: :destroy
  has_many :highResolutionImages, dependent: :destroy
  


  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :testimonials
  # belongs_to :admin

  has_many :galleryThumbnails
  has_many :highResolutionImages
end
