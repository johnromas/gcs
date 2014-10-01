class CreateClaimants < ActiveRecord::Migration
  def change
    create_table :claimants do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.references :state, index: true
      t.string :zip
      t.string :phone
      t.string :mobile
      t.text :notes

      t.timestamps
    end
  end
end
