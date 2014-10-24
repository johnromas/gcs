class LineItem < ActiveRecord::Base
  belongs_to :billing
  before_save :calculate_total
  after_save :update_billing_total
  after_destroy :update_billing_total 

  def calculate_total
  	self.total = self.quantity * self.unit_price
  end

  def update_billing_total
  	self.billing.calculate_billing_total
  end
end
