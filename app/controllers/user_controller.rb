class UserController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_path
  
   layout "user_layout"
  def index
   @total_donations = Donation.count
   @pledges = Pledge.all
  end

  def profile
   @pledge = current_user.pledges
  end
  def project
   @project = current_user.projects
  end
  def donation
   @pledge = current_user.pledges
  end
end
