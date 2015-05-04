class Coffeeshop < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_and_belongs_to_many :facilities
end
