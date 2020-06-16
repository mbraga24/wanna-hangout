class Location < ApplicationRecord
  has_many :hangouts
  has_many :users
end
