class AddCiteLetterMessageToClaims < ActiveRecord::Migration
  def change
  	add_column :claims, :cite_letter_message, :text
  end
end
