class State < ActiveRecord::Base
	has_many :doctors
	has_many :claimants

	validates_presence_of :name, :abbr

  def self.ordered_by_name
    order(:name)
  end
end
