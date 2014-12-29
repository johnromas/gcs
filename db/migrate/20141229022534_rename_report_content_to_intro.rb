class RenameReportContentToIntro < ActiveRecord::Migration
  def change
  	rename_column :reports, :content, :intro
  	add_column :reports, :outro, :text
  end
end
