class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :claim

  validates_presence_of :date, :time, :doctor_id

  scope :dashboard, -> { where("date >= ? AND date <= ?", Date.today, Date.today + 7).order("date ASC")}
end
