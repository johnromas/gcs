class Claimant < ActiveRecord::Base
  belongs_to :state
  has_many :claims

  validates_presence_of :first_name, :last_name
  

  def full_name
  	self.first_name + " " + self.last_name
  end
end
