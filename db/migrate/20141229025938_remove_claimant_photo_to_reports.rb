class RemoveClaimantPhotoToReports < ActiveRecord::Migration
  def change
    remove_column :reports, :photo, :string
  end
end
