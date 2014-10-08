json.array!(@attorneys) do |attorney|
  json.extract! attorney, :id, :first_name, :last_name, :address, :city, :state_id, :zip, :phone, :email
  json.url attorney_url(attorney, format: :json)
end
