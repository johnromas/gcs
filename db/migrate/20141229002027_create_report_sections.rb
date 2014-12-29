class CreateReportSections < ActiveRecord::Migration
  def change
    create_table :report_sections do |t|
      t.string :title
      t.text :content
      t.integer :position
      t.references :report, index: true

      t.timestamps
    end
  end
end
