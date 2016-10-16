class CharityController < ApplicationController
    include CurrentCart
    before_action :set_cart


  def index
   @top_priority = Project.top_featured
   @watching = Project.top_watched
   #@projects = Project.order(:title)
  end
end
