class DashboardController < ApplicationController
  def index
  	@appointments = Appointment.dashboard
  	@claimants = Claimant.recent
  	@invoices = Billing.past_due
  end
end
