class RenameClosesToClosesAtInProjects < ActiveRecord::Migration
  def up
    rename_column :projects, :closes, :closes_at
  end

  def down
    rename_column :projects, :closes_at, :closes
  end
end
