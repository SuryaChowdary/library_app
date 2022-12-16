class Bookroom < ApplicationRecord
   
  validates :name , presence: true
  has_many :bookroom_locations
  has_many :locations , through: :bookroom_locations

end