require 'rails_helper'

RSpec.describe "donations/show", type: :view do
  before(:each) do
    @donation = assign(:donation, Donation.create!(
      :name => "Name",
      :address => "MyText",
      :email => "Email",
      :pay_type => "Pay Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Pay Type/)
  end
end
