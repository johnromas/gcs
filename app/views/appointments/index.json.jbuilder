json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :date, :time, :doctor_id, :claim_id
  json.url appointment_url(appointment, format: :json)
end
