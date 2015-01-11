class Doctor < ActiveRecord::Base
  belongs_to :state
  has_many :appointments, dependent: :restrict

  validates_presence_of :first_name, :last_name, :city, :state_id, :zip, :phone

  def full_name
  	self.first_name + " " + self.last_name
  end
end
