class Book < ApplicationRecord 
  belongs_to :author
  attr_accessor :skip_author
  validates_presence_of :author, :if =>  lambda{|e| e.skip_author ...author}
  validates :title , presence: true , length: {minimum:6 , maximun:100}
  validates :pages , presence: true , length: {minimum:1 , maximum:1000}
  validates :date_of_publication , presence: true 
  validates :summary , presence: true , length: {minimum:6 , maximum:200}
  validates :rent , presence: true 
end 