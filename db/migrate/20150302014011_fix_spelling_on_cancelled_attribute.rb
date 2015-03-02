class FixSpellingOnCancelledAttribute < ActiveRecord::Migration
  def change
    rename_column :appointments, :canceled, :cancelled
  end
end
