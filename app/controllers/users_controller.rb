class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @voices = @user.voices
  end
  
  def index
    if params[:industry_name].present?
      @users = User.where(industry: params[:industry_name])#industryがnilの場合は全ユーザー表示
    else
      @users = User.all#industryに数値がある場合はその業種のユーザー表示
    # @users = User.where(industry: 1 ) #industry1の漁業ユーザーのみ表示
    end
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
  
  def follow
    @user = User.find(params[:id])
  end

  def follower
    @user = User.find(params[:id])
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
