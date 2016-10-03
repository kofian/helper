class PledgesController < ApplicationController
   include CurrentCart
   before_action :set_cart, only: [:create]
   before_action :set_pledge, only: [:show, :edit, :update, :destroy]
   before_action :require_user
   before_action :require_same_user, only: [:destroy, :show]
   before_action :require_admin_user, only: [:index, :edit, :update]
   rescue_from ActiveRecord::RecordNotFound, with: :invalid_path

  # GET /pledges
  # GET /pledges.json
  def index
    @pledges = Pledge.all
  end

  # GET /pledges/1
  # GET /pledges/1.json
  def show
  end

  # GET /pledges/new
  def new
    #if current_user.nil?
     #redirect_to new_user_session_path, notice: "You need to sign in first"
    #return
    #end
    @pledge = Pledge.new
  end

  # GET /pledges/1/edit
  def edit
  end

  # POST /pledges
  # POST /pledges.json
  def create
    #if current_user.nil?
     #redirect_to new_user_session_path, notice: "You need to sign in first"
    #return
    #end

    project = Project.find(params[:project_id])
    @pledge = @cart.add_project(project.id)
    @pledge.amount += params[:amount].to_f
    @pledge.user_id = current_user.id
    #@pledge = @cart.pledges.build(project: project)
    #@pledge = Pledge.new(pledge_params)

    respond_to do |format|
      if @pledge.save
        format.html { redirect_to charity_url }
        format.js  { @current_pledge = @pledge}
        format.json { render :show, status: :created, location: @pledge }
      else
        format.html { render :new }
        format.json { render json: @pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pledges/1
  # PATCH/PUT /pledges/1.json
  def update
    respond_to do |format|
      if @pledge.update(pledge_params)
        format.html { redirect_to @pledge, notice: 'Pledge was successfully updated.' }
        format.json { render :show, status: :ok, location: @pledge }
      else
        format.html { render :edit }
        format.json { render json: @pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pledges/1
  # DELETE /pledges/1.json
  def destroy
    @pledge.destroy
    respond_to do |format|
      format.html { redirect_to pledges_url, notice: 'Pledge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pledge
      @pledge = Pledge.find(params[:id])
    end

     def require_same_user
        if current_user != @pledge.user and !current_user.admin?
         flash[:danger] = "You can only delete your pledge"
         redirect_to charity_path
        end
      end
 
    # Never trust parameters from the scary internet, only allow the white list through.
    def pledge_params
      params.require(:pledge).permit(:project_id, :amount)
    end
end
