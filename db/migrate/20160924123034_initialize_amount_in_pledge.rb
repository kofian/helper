class InitializeAmountInPledge < ActiveRecord::Migration
  def up
   remove_column :pledges, :amount, :decimal, precision: 8, scale: 2
  end

  def down
   add_column :pledges, :amount, :decimal, default: 1.00, precision: 8, scale: 2
  end
end
