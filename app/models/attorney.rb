class Attorney < ActiveRecord::Base
  belongs_to :state
  has_many :claims, dependent: :restrict

  def self.ordered_by_name
    order(:first_name)
  end

	def full_name
		self.first_name + " " + self.last_name
	end
end
