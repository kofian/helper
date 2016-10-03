require 'rails_helper'

RSpec.describe CharityController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)

      expect(index).to have_selector("#columns #side a" , minimum: 4)
      assert_select '#main .entry' , 3
      assert_select 'h3' , 'Saving Kelly'
      assert_select '.estimate' , /\$[,\d]+\.\d\d/
    end
  end

end
