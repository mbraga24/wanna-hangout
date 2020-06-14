class User < ApplicationRecord
  has_many :user_hangouts
  has_many :hangouts, through: :user_hangouts
  has_and_belongs_to_many :interests
  has_secure_password
end
