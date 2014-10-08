class AddFieldsToDoctors < ActiveRecord::Migration
  def change
  	add_column :doctors, :credentials, :string
  	add_column :doctors, :active_practice, :string
  	add_column :doctors, :board_certified, :string
  	add_column :doctors, :fax, :string
  	add_column :doctors, :email, :string
  	add_column :doctors, :ime_charge, :decimal
  	add_column :doctors, :no_show_fee, :decimal
  	add_column :doctors, :deposition_fee, :decimal
  	add_column :doctors, :deposition_cancel_fee, :decimal
  	add_column :doctors, :record_review_fee, :decimal
  	add_column :doctors, :tax_id, :string
  	add_column :doctors, :license_number, :string
  	add_column :doctors, :approx_turn_around, :string
  	add_column :doctors, :dictation_service_interest, :boolean
  end
end
