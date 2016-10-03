class CharityController < ApplicationController
    include CurrentCart
    before_action :set_cart


  def index
   @projects = Project.order(:title)
  end
end
