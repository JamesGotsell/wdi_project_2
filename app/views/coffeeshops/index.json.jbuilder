json.array!(@coffeeshops) do |coffeeshop|
  json.extract! coffeeshop, :id, :name, :latitude, :longitude, :address, :description, :picture, :user_id
  json.url coffeeshop_url(coffeeshop, format: :json)
end
