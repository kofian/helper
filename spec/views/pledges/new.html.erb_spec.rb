require 'rails_helper'

RSpec.describe "pledges/new", type: :view do
  before(:each) do
    assign(:pledge, Pledge.new(
      :project => nil,
      :cart => nil
    ))
  end

  it "renders new pledge form" do
    render

    assert_select "form[action=?][method=?]", pledges_path, "post" do

      assert_select "input#pledge_project_id[name=?]", "pledge[project_id]"

      assert_select "input#pledge_cart_id[name=?]", "pledge[cart_id]"
    end
  end
end
