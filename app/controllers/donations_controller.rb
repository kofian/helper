class DonationsController < ApplicationController

   include CurrentCart

   before_action :set_user_cart, only: [:new, :create]
   before_action :set_donation, only: [:show, :edit, :update, :destroy]
   before_action :require_user, except: [:show]   
   #before_action :require_same_user, except: [:show]
   before_action :require_admin_user, only: [:destroy]   
   rescue_from ActiveRecord::RecordNotFound, with: :invalid_path



  # GET /donations
  # GET /donations.json
  def index
    @donations = Donation.all
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
  end

  # GET /donations/new
  def new
    if @cart.pledges.empty? 
     #if @user_cart.pledges.empty?|| @cart.pledges.empty?
    redirect_to charity_url, notice: "You made no pledge"
    return
    end
    @donation = Donation.new
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(donation_params)
    @donation.add_pledges_from_cart(@cart)
    respond_to do |format|
      if @donation.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to charity_url, notice: 'God bless you for helping out.' }
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donations/1
  # PATCH/PUT /donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:name, :address, :email, :pay_type)
    end
     #To be implemented
    def require_same_user
      if current_user != @donation.user and !current_user.admin?
       flash[:danger] = "You can only honor your pledge only"
       redirect_to charity_path
     end
   end
end
