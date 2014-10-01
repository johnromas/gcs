json.array!(@claims) do |claim|
  json.extract! claim, :id, :number, :claimant_id, :insurance_company_id, :adjustor_id, :doctor_id, :attorney_id, :appointment_id
  json.url claim_url(claim, format: :json)
end
