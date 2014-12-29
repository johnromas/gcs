class RemoveClaimantPhotoToClaimants < ActiveRecord::Migration
  def change
    remove_column :claimants, :photo, :string
  end
end
