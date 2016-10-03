class AddAmountToPledge < ActiveRecord::Migration
  def change
   add_column :pledges, :amount, :decimal, default: 1.00, precision: 8, scale: 2
  end
end
