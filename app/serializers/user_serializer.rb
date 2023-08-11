class UserSerializer < ActiveModel::Serializer
  attributes :id,:name, :email, :profile_picture, :isAdmin
end
