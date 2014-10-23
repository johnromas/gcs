class CreateBillings < ActiveRecord::Migration
  def up
    create_table :billings do |t|
      t.references :claim, index: true
      t.string :invoice_nbr
      t.date :invoice_date
      t.references :insurance_company, index: true
      t.references :attorney, index: true
      t.references :claimant, index: true
      t.decimal :subtotal
      t.decimal :total
      t.decimal :paid

      t.timestamps
    end
  end

  def down
    drop_table :billings
  end
end
