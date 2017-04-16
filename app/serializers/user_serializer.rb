class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :family_name, :given_name
end
