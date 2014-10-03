class Claim < ActiveRecord::Base
  belongs_to :claimant
  belongs_to :insurance_company
  belongs_to :adjustor
  belongs_to :doctor
  belongs_to :attorney
  has_many :appointments

  accepts_nested_attributes_for :appointments
  accepts_nested_attributes_for :claimant
  
  validates_presence_of :number

end
