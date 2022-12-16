class Location < ApplicationRecord
  validates :place , presence: true
  has_many :bookroom_locations
  has_many :bookrooms , through: :bookroom_locations
end