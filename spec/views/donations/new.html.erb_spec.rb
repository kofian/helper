require 'rails_helper'

RSpec.describe "donations/new", type: :view do
  before(:each) do
    assign(:donation, Donation.new(
      :name => "MyString",
      :address => "MyText",
      :email => "MyString",
      :pay_type => "MyString"
    ))
  end

  it "renders new donation form" do
    render

    assert_select "form[action=?][method=?]", donations_path, "post" do

      assert_select "input#donation_name[name=?]", "donation[name]"

      assert_select "textarea#donation_address[name=?]", "donation[address]"

      assert_select "input#donation_email[name=?]", "donation[email]"

      assert_select "input#donation_pay_type[name=?]", "donation[pay_type]"
    end
  end
end
