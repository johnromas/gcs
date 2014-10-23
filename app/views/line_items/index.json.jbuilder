json.array!(@line_items) do |line_item|
  json.extract! line_item, :id, :billing_id, :quantity, :date, :cpt_code, :description, :unit_price, :total
  json.url line_item_url(line_item, format: :json)
end
