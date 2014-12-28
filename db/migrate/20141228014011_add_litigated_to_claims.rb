class AddLitigatedToClaims < ActiveRecord::Migration
  def change
  	add_column :claims, :litigated, :boolean, default: false
  end
end
