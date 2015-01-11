class Claim < ActiveRecord::Base
  belongs_to :claimant
  belongs_to :insurance_company
  belongs_to :adjustor
  belongs_to :doctor
  belongs_to :attorney
  has_one :appointment
  has_many :billings, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :injuries, dependent: :destroy

  accepts_nested_attributes_for :appointment
  accepts_nested_attributes_for :claimant
  accepts_nested_attributes_for :injuries, allow_destroy: true

  
  validates_presence_of :number, :adjustor_id
  validates_associated :appointment, :claimant

end
