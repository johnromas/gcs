class CreateAdjustors < ActiveRecord::Migration
  def change
    create_table :adjustors do |t|
      t.references :insurance_company, index: true
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :mobile
      t.text :notes

      t.timestamps
    end
  end
end
