json.array!(@billings) do |billing|
  json.extract! billing, :id, :claim_id, :invoice_nbr, :invoice_date, :insurance_company_id, :attorney_id, :claimant_id, :subtotal, :total, :paid
  json.url billing_url(billing, format: :json)
end
