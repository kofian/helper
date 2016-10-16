class AddOtherThingsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :opens_at, :datetime
    add_column :projects, :closes, :datetime
  end
end
