class AddFieldsToClaims < ActiveRecord::Migration
  def change
  	add_column :claims, :service, :string
  	add_column :claims, :insured, :string
  	add_column :claims, :allegation, :string
  	add_column :claims, :case, :string
  	add_column :claims, :date_of_injury, :date
  end
end
