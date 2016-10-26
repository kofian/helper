class UserController < ApplicationController
  before_filter :set_user, only: [:show, :edit, :update]
  before_filter :validate_authorization_for_user, only: [:edit, :update]

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
  def show
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def validate_authorization_for_user
       redirect_to root_path unless @user == current_user
    end

end
