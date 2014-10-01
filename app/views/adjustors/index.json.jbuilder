json.array!(@adjustors) do |adjustor|
  json.extract! adjustor, :id, :insurance_company_id, :first_name, :last_name, :phone, :mobile, :notes
  json.url adjustor_url(adjustor, format: :json)
end
