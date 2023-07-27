class UsersSerializer < ActiveModel::Serializer
  attributes :name, :email, :password_digest, :profile_picture
end
