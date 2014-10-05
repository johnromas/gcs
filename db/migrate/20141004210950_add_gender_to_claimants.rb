class AddGenderToClaimants < ActiveRecord::Migration
  def change
  	add_column :claimants, :gender, :string
  end
end
