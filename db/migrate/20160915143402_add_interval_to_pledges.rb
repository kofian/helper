class AddIntervalToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :interval, :integer, default: 1
    add_column :pledges, :amount, :decimal, precision: 8, scale: 2
  end
end
