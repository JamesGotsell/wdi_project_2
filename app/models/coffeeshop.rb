class Coffeeshop < ActiveRecord::Base

 belongs_to :user
 has_many :reviews
 has_and_belongs_to_many :facilities
 validates :name, presence: true, length: { minimum: 2 }
 validates :description, length: { maximum: 500 }
 validates :address, presence: true 
 geocoded_by :address
 reverse_geocoded_by :latitude, :longitude
 after_validation :geocode, :reverse_geocode
 
 mount_uploader :picture, CoffeePictureUploader
 
 def calculateAverage
   total = 1
   if self.reviews.length != 0
     total = self.reviews.length
   end
   self.reviews.inject(0){|sum , review | sum + review.rating.to_f }  /  total
 end

end