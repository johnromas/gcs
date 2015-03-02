class AddCanceledToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :canceled, :boolean, default: false
  end
end
