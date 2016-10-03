class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :estimate, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
