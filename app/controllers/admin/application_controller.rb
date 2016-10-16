class Admin::ApplicationController < ApplicationController
  before_filter :require_admin

 private
 
  def require_admin
   unless admin_signed_in?
    flash[:danger] = "You must be signed in as an Administrator to access this page"
    redirect_to new_user_session_path
   end
  end
 
  def admin_signed_in?
   user_signed_in? && current_user.admin?
  end

  def require_project
    #@project = Project.find(params[:project_id] || params[:id])
    @project = Project.find_by!(slug: params[:slug])
  end

end
