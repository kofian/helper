class AddUserToPledge < ActiveRecord::Migration
  def change
    add_reference :pledges, :user, index: true, foreign_key: true
  end
end
