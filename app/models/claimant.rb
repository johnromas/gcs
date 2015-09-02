class Claimant < ActiveRecord::Base
  belongs_to :state
  has_many :claims, dependent: :restrict

  validates_presence_of :first_name, :last_name

	scope :recent, lambda { where("created_at >= :start_date AND created_at <= :end_date", {:start_date => 1.week.ago, :end_date => Time.now }) }

  def self.ordered_by_name
    order(:first_name)
  end

  def full_name
  	self.first_name + " " + self.last_name
  end

end
