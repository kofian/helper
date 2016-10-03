class UserController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_path

  def index
   @total_donations = Donation.count
   @pledges = Pledge.all
  end

end
