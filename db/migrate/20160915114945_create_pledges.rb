class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :project, index: true, foreign_key: true
      t.belongs_to :cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
