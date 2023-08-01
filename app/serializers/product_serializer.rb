class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name,:price, :image,:description, :category, :quantity
end
