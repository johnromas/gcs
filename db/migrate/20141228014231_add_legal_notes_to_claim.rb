class AddLegalNotesToClaim < ActiveRecord::Migration
  def change
  	add_column :claims, :legal_notes, :text
  end
end
