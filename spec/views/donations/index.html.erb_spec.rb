require 'rails_helper'

RSpec.describe "donations/index", type: :view do
  before(:each) do
    assign(:donations, [
      Donation.create!(
        :name => "Name",
        :address => "MyText",
        :email => "Email",
        :pay_type => "Pay Type"
      ),
      Donation.create!(
        :name => "Name",
        :address => "MyText",
        :email => "Email",
        :pay_type => "Pay Type"
      )
    ])
  end

  it "renders a list of donations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Pay Type".to_s, :count => 2
  end
end
