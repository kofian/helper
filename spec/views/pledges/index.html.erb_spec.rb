require 'rails_helper'

RSpec.describe "pledges/index", type: :view do
  before(:each) do
    assign(:pledges, [
      Pledge.create!(
        :project => nil,
        :cart => nil
      ),
      Pledge.create!(
        :project => nil,
        :cart => nil
      )
    ])
  end

  it "renders a list of pledges" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
