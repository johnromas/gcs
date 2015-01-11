class Adjustor < ActiveRecord::Base
  belongs_to :insurance_company
  has_many :claims, dependent: :restrict

  validates_presence_of :first_name, :last_name, :insurance_company

	def full_name
		self.first_name + " " + self.last_name
	end

end
