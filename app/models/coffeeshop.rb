class Coffeeshop < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_and_belongs_to_many :facilities
  validates :name, presence: true, length: { minimum: 2 }
  validates :description, length: { maximum: 500 }
  validates :address, presence: true 

  mount_uploader :picture, PictureUploader
end
