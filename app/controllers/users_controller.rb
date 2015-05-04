class UsersController < ApplicationController

  def index
    @users = User.all
  end 
  
  def show
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:users).permit(:name, :profile_pic)
  end
end

