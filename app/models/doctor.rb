class Doctor < ActiveRecord::Base
  belongs_to :state
  has_many :appointments, dependent: :restrict

  validates_presence_of :first_name, :last_name, :city, :state_id, :zip, :phone

  def self.ordered_by_name
    order(:first_name)
  end

  def full_name
  	self.first_name + " " + self.last_name
  end
end
