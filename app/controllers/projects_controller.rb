class ProjectsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  before_action :set_project, only: [:show, :edit, :update, :destroy, :like]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_admin_user, only: [:destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_path

  # GET /projects
  # GET /projects.json
  def index
    #@projects = Project.all.sort_by{|likes| likes.thumbs_up_total}
     @projects = Project.paginate(page: params[:page], per_page: 2)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
   respond_to do |format|
    format.html 
    format.js
   end

  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def who_donated
   @project = Project.find(params[:id])
   @latest_donation = @project.donations.order(:updated_at).last
   if stale?(@latest_donation)
     respond_to do |format|
       format.atom
     end
   end
  end

   def like
     like = Like.create(like: params[:like], user: current_user, project: @project)
     if like.valid?
      flash[:success] = "You like this project"
      redirect_to :back
     else
      flash[:danger] = "You can only vote once"
      redirect_to :back
     end
   end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end
    def require_same_user
      if current_user != @project.user and !current_user.admin?
       flash[:danger] = "You can only edit your project"
       redirect_to projects_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :image_url, :estimate, :picture)
    end
end
