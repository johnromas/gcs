class State < ActiveRecord::Base
	has_many :doctors
	has_many :claimants
end
