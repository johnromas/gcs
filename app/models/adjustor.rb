class Adjustor < ActiveRecord::Base
  belongs_to :insurance_company
  has_many :claims

	def full_name
		self.first_name + " " + self.last_name
	end
	
end
