require 'rails_helper'

RSpec.describe "projects/show", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :title => "Title",
      :description => "MyText",
      :image_url => "ImageUrl.jpg",
      :estimate => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/ImageUrl.jpg/)
    expect(rendered).to match(/9.99/)
  end
end
