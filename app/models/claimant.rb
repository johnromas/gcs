class Claimant < ActiveRecord::Base
  belongs_to :state
  has_many :claims

  validates_presence_of :first_name, :last_name
  
	scope :recent, lambda { where("created_at >= :start_date AND created_at <= :end_date", {:start_date => 1.week.ago, :end_date => Time.now }) }

  def full_name
  	self.first_name + " " + self.last_name
  end
end
