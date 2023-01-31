class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name , presence: true, length: {minimum: 3 , maximum: 100}
  validates :gender , presence: true
  validates :age, presence: true
  validates :date_of_birth , presence: true 
  validates :address, presence: true , length: {minimum:3, maximum:100}
end 