class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :password_digest, :profile_picture
end
