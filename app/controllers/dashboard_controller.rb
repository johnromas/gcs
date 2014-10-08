class DashboardController < ApplicationController
  def index
  	@appointments = Appointment.dashboard
  	@claimants = Claimant.recent
  end
end
