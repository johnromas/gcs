class CreateInjuries < ActiveRecord::Migration
  def change
    create_table :injuries do |t|
      t.date :date
      t.references :claim, index: true

      t.timestamps
    end
  end
end
