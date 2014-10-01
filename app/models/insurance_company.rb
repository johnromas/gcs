class InsuranceCompany < ActiveRecord::Base
  belongs_to :state
  has_many :claims
end
