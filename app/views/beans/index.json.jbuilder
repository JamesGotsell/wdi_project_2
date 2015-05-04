json.array!(@beans) do |bean|
  json.extract! bean, :id, :name
  json.url bean_url(bean, format: :json)
end
