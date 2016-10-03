class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :pay_type

      t.timestamps null: false
    end
  end
end
