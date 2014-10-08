class CreateAttorneys < ActiveRecord::Migration
  def change
    create_table :attorneys do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.references :state, index: true
      t.string :zip
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
