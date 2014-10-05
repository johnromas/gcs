class AddFieldsToClaimants < ActiveRecord::Migration
  def change
  	add_column :claimants, :ssn, :string
  	add_column :claimants, :email, :string
  	add_column :claimants, :dob, :date
  end
end
