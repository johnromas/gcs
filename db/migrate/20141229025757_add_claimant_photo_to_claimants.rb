class AddClaimantPhotoToClaimants < ActiveRecord::Migration
  def change
    add_column :claimants, :photo, :string
  end
end
