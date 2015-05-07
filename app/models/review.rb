class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :coffeeshop
  validates :rating , numericality: :true 

<<<<<<< HEAD
=======

>>>>>>> 59ad9e77b907e2c74f8a388567ea9635b50ba122
end
 