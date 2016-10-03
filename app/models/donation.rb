class Donation < ActiveRecord::Base

  PAYMENT_TYPES = ["Check", "Credit Card", "Bank Deposit"]

  has_many :pledges, dependent: :destroy

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_pledges_from_cart(cart)
   cart.pledges.each do |pledge|
    pledge.cart_id = nil
    pledges << pledge
   end
  end

end
