require 'rails_helper'

RSpec.describe "pledges/edit", type: :view do
  before(:each) do
    @pledge = assign(:pledge, Pledge.create!(
      :project => nil,
      :cart => nil
    ))
  end

  it "renders the edit pledge form" do
    render

    assert_select "form[action=?][method=?]", pledge_path(@pledge), "post" do

      assert_select "input#pledge_project_id[name=?]", "pledge[project_id]"

      assert_select "input#pledge_cart_id[name=?]", "pledge[cart_id]"
    end
  end
end
