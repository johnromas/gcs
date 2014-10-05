class InsuranceCompany < ActiveRecord::Base
  belongs_to :state
  has_many :claims
  has_many :adjustors

  validates_presence_of :name

end
