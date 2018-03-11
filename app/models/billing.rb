class Billing < ActiveRecord::Base
  belongs_to :claim
  belongs_to :insurance_company
  belongs_to :attorney
  belongs_to :claimant
  has_many :line_items, dependent: :destroy

  scope :open, -> { where(paid_in_full: false).order("invoice_date DESC") }
  scope :past_due, -> { where("invoice_date <= ? AND paid_in_full = false", Date.today - 30).order("invoice_date DESC")}

  def calculate_billing_total
  	sum = 0
  	self.line_items.each do |line_item|
  		sum += line_item.total
  	end
  	self.update_attributes(total: sum)
  end

  def formatted_date
    invoice_date ? invoice_date.strftime("%m/%d/%y") : 'No Date'
  end
end
