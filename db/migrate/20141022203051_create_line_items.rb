class CreateLineItems < ActiveRecord::Migration
  def up
    create_table :line_items do |t|
      t.references :billing, index: true
      t.decimal :quantity
      t.date :date
      t.string :cpt_code
      t.text :description
      t.decimal :unit_price
      t.decimal :total

      t.timestamps
    end
  end

  def down
    drop_table :line_items
  end
end