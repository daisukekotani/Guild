class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @voices = @user.voices
  end
  
  def index
    @user = current_user.id
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(
      :name,
      :sex,
      :sex_hidden,
      :age,
      :age_hidden,
      :income,
      :income_hidden,
      :industry,
      :job,
      :introduction,
      :profile_image)
  end
end
