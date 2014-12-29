class Claim < ActiveRecord::Base
  belongs_to :claimant
  belongs_to :insurance_company
  belongs_to :adjustor
  belongs_to :doctor
  belongs_to :attorney
  has_one :appointment
  has_many :billings
  has_many :reports

  accepts_nested_attributes_for :appointment
  accepts_nested_attributes_for :claimant
  
  validates_presence_of :number, :adjustor_id
  validates_associated :appointment, :claimant


end
