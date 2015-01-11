class Attorney < ActiveRecord::Base
  belongs_to :state
  has_many :claims, dependent: :restrict

	def full_name
		self.first_name + " " + self.last_name
	end
end
