class Company < ApplicationRecord
  validates :name , presence: true
  has_many :company_locations
  has_many :locations , through: :company_locations
  has_many :libraries
end 