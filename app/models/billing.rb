class Billing < ActiveRecord::Base
  belongs_to :claim
  belongs_to :insurance_company
  belongs_to :attorney
  belongs_to :claimant
  has_many :line_items

  def calculate_billing_total
  	sum = 0
  	self.line_items.each do |line_item|
  		sum += line_item.total
  	end
  	self.update_attributes(total: sum)
  end
end