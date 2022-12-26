class Region < ApplicationRecord
  validates :name, presence: true
  has_many :locations
end