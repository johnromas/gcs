class DashboardController < ApplicationController
  def index
  	@appointments = Appointment.dashboard
  	@claimants = Claimant.recent
  	@invoices = Billing.open
  end
end
