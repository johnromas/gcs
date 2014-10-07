class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :claim

  validates_presence_of :date, :time, :doctor_id

end
