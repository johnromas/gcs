class AddColumnsToStates < ActiveRecord::Migration
  def change
  	add_column :states, :ansi_code, :string
  	add_column :states, :statens, :string
  	rename_column :states, :abbreviation, :abbr
  end
end
