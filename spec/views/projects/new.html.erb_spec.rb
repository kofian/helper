require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, Project.new(
      :title => "MyString",
      :description => "MyText",
      :image_url => "MyString",
      :estimate => "9.99"
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input#project_title[name=?]", "project[title]"

      assert_select "textarea#project_description[name=?]", "project[description]"

      assert_select "input#project_image_url[name=?]", "project[image_url]"

      assert_select "input#project_estimate[name=?]", "project[estimate]"
    end
  end
end
