class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category, :quantity, :price, :image, :admin_id
end
