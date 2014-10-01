class Claimant < ActiveRecord::Base
  belongs_to :state
  has_many :claims

  def full_name
  	self.first_name + " " + self.last_name
  end
end
