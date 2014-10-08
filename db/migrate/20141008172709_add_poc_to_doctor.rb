class AddPocToDoctor < ActiveRecord::Migration
  def change
  	add_column :doctors, :poc_first_name, :string
  	add_column :doctors, :poc_last_name, :string
  	add_column :doctors, :poc_phone, :string
  	add_column :doctors, :poc_email, :string
  end
end
