class Billing < ActiveRecord::Base
  belongs_to :claim
  belongs_to :insurance_company
  belongs_to :attorney
  belongs_to :claimant
  has_many :line_items
end