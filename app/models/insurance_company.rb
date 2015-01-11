class InsuranceCompany < ActiveRecord::Base
  belongs_to :state
  has_many :claims, dependent: :restrict
  has_many :adjustors, dependent: :restrict

  validates_presence_of :name

end
