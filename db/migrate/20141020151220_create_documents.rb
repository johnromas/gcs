class CreateDocuments < ActiveRecord::Migration
  def up
    create_table :documents do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
  	drop_table :documents
  end
end
