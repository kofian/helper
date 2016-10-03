class AddDonationToPledge < ActiveRecord::Migration
  def change
    add_reference :pledges, :donation, index: true, foreign_key: true
  end
end
