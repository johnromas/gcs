class InsuranceCompany < ActiveRecord::Base
  belongs_to :state
  has_many :claims

  validates_presence_of :name

end
