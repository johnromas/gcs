json.array!(@insurance_companies) do |insurance_company|
  json.extract! insurance_company, :id, :name, :phone, :address, :city, :state_id, :zip
  json.url insurance_company_url(insurance_company, format: :json)
end
