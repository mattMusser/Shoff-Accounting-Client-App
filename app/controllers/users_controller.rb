class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.all
    @client = User.find(params[:id])
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information was updated."
      redirect_to edit_user_registration_path
    else
      flash[:error] = "An error occured. Please try again."
      redirect_to edit_user_registration_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
end
