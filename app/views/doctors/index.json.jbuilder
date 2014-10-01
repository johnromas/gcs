json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :first_name, :last_name, :address, :city, :state_id, :zip, :phone, :mobile, :notes
  json.url doctor_url(doctor, format: :json)
end
