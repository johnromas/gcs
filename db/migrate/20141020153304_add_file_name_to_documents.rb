class AddFileNameToDocuments < ActiveRecord::Migration
  def up
    add_column :documents, :file_name, :string
  end

  def down
    remove_column :documents, :file_name, :string
  end
end
