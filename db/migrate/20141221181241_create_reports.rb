class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :claim, index: true
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
