class Location < ApplicationRecord
  validates :name , presence: true
  has_many :company_locations
  has_many :companies , through: :company_locations
  belongs_to :region
end 