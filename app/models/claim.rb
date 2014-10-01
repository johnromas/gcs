class Claim < ActiveRecord::Base
  belongs_to :claimant
  belongs_to :insurance_company
  belongs_to :adjustor
  belongs_to :doctor
  belongs_to :attorney
  belongs_to :appointment
end
