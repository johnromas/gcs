class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :time
      t.references :doctor, index: true
      t.references :claim, index: true

      t.timestamps
    end
  end
end
