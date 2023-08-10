class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :profile_picture, :isAdmin
end
