class AddPaidInFullToBillings < ActiveRecord::Migration
  def change
    add_column :billings, :paid_in_full, :boolean, default: false
  end
end
