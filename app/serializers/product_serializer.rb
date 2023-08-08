class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name,:price, :image,:description, :category, :quantity
  has_many :galleryThumbnails
  has_many :highResolutionImages
end
