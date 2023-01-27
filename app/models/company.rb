class Company < ApplicationRecord
  validates :name , presence: true
  has_many :company_regions
  has_many :regions, through: :company_regions
  has_many :company_locations
  has_many :locations , through: :company_locations
  has_many :libraries
  validate :check_region_and_location

  private

  # private method to ensure the client has regions and locations assocaited or not
  def check_region_and_location
    if self.region_ids.blank?
      errors.add(:region_ids, "Please select at least one region")
    end
    if self.location_ids.blank?
      errors.add(:location_ids, "Please select at least one location")
    end
  end
end 