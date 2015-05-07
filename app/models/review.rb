class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :coffeeshop
  validates :rating , numericality: :true 
end
 