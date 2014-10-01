json.array!(@claimants) do |claimant|
  json.extract! claimant, :id, :first_name, :last_name, :address, :city, :state_id, :zip, :phone, :mobile, :notes
  json.url claimant_url(claimant, format: :json)
end
