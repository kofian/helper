class Admin::UsersController < Admin::ApplicationController
 before_action :set_user, only: [:show, :edit, :update, :destroy]

   # Get /admin/users
  def index
   render locals: { users:  User.all }
  end

    # Get /admin/users/1
  def show
   render locals: { user: @user }
  end
 
   # Get /admin/users/1/edit
  def edit
   render locals: { user: @user }
  end

    # PATCH/PUT /admin/users/1
  def update
   if @user.update(user_params)
     flash[:notice] = "#{@user.name} was successfully updated."
     redirect_to admin_users_path
   else
     render :edit, locals: { user: @user }
   end
  end

    # DELETE /admin/users/1
   def destroy
    user_name = @user.name
    @user.destroy
     flash[:notice] = "#{@user.name} was successfully destroyed."
     redirect_to admin_users_path
   end

  private
   # Use callbacks to share common setup or constraints between actions.

  def set_user
   @user = User.find(params[:id])
  end

   # Only allow a trusted parameter "white list" through
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :featured)
  end

end
