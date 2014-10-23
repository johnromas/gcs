class LineItem < ActiveRecord::Base
  belongs_to :billing
  before_save :total

  def total
  	# self.total = self.quantity * self.unit_price
  end
end
