class Adjustor < ActiveRecord::Base
  belongs_to :insurance_company
  has_many :claims
end
