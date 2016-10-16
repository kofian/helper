class Admin::ProjectsController < Admin::ApplicationController
  before_filter :require_project, only: [:destroy, :edit, :update, :show]
   
    # GET admin/projects/1/edit
   def edit
   end


    # PATCH/PUT /projects/1
    # PATCH/PUT /projects/1.json
   def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to admin_project_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
   end

    def show
      pledge = @project.pledges.includes(:user).recent
      rating_counts = @project.thumbs_up_total
       
      render locals: {
              pledge: pledge,
              rating_counts: rating_counts
            }
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

   def archive
     @project = Project.find_by_id(params[:project_id])
      if @project
        @project.archive
         flash[:alert] = "#{@project.title} is now archived."
         redirect_to :back
      else
        redirect_to admin_projects_path
      end
    end

    def unarchive
      @project = Project.find_by_id(params[:project_id])
        if @project
         @project.unarchive
         flash[:alert] = "#{@project.title} is now current."
      else
        flash[:danger] = "Project not found. Unable to unarchive."
      end
        redirect_to admin_projects_path
    end

   def faeture
     @project = Project.find_by_id(params[:project_id])
      if @project
        @project.faeture
         flash[:alert] = "#{@project.title} is now featured."
         redirect_to :back
      else
        redirect_to admin_projects_path
      end
    end

    def unfaeture
      @project = Project.find_by_id(params[:project_id])
        if @project
         @project.unfaeture
         flash[:alert] = "#{@project.title} is now normal priority."
      else
        flash[:danger] = "Project not found. Unable to unfeature."
      end
        redirect_to admin_projects_path
    end

   def watched
     @project = Project.find_by_id(params[:project_id])
      if @project
        @project.watched
         flash[:alert] = "#{@project.title} is now watched."
         redirect_to :back
      else
        redirect_to admin_projects_path
      end
    end

    def unwatched
      @project = Project.find_by_id(params[:project_id])
        if @project
         @project.unwatched
         flash[:alert] = "#{@project.title} is now normal project."
      else
        flash[:danger] = "Project not found. Unable to unwatched."
      end
        redirect_to admin_projects_path
    end

    def index
     @projects = Project.order('archived').all
    end

end










