class CompanyRegion < ApplicationRecord 
  belongs_to :company
  belongs_to :region
end