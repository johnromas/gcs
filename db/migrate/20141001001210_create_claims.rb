class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.string :number
      t.references :claimant, index: true
      t.references :insurance_company, index: true
      t.references :adjustor, index: true
      t.references :attorney, index: true
      t.references :appointment, index: true

      t.timestamps
    end
  end
end
