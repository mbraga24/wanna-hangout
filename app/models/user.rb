class User < ApplicationRecord
  has_many :user_hangouts
  has_many :hangouts, through: :user_hangouts
end
