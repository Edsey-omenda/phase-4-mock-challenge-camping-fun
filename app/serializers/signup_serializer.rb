class SignupSerializer < ActiveModel::Serializer
  attributes :id, :difficulty

  has_one :activity
  has_one :camper
end
