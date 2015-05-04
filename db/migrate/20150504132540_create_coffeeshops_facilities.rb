class CreateCoffeeshopsFacilities < ActiveRecord::Migration 
  def change
      create_join_table(:coffeeshops, :facilities)
    
  end
end



   
