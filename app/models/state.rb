class State < ActiveRecord::Base
	has_many :doctors
	has_many :claimants

	validates_presence_of :name, :abbr
end
