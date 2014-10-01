class CreateInsuranceCompanies < ActiveRecord::Migration
  def change
    create_table :insurance_companies do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :city
      t.references :state, index: true
      t.string :zip

      t.timestamps
    end
  end
end
