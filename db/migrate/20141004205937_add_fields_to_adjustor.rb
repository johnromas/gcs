class AddFieldsToAdjustor < ActiveRecord::Migration
  def change
  	add_column :adjustors, :fax, :string
  	add_column :adjustors, :email, :string
  end
end
