class Location < ApplicationRecord
  validates :place , presence: true
  has_many :company_locations
  has_many :companies , through: :company_locations
end 