class VoicesController < ApplicationController
  before_action :authenticate_user!
  def new
    @voice = Voice.new
  end  
  
  def create
    @voice = Voice.new(voice_params)
    @voice.user_id = current_user.id
    if @voice.save
    redirect_to user_path(current_user.id), notice: "投稿できました"
    else
      render 'new'
    end  
  end
  
  def index
    @voices = Voice.all
    @users = User.all
  end
  
  def show
    @voice = Voice.find(params[:id])
    @post_comment = PostComment.new
  end  
  
  
  
  def edit
    @voice = Voice.find(params[:id])
    if @voice.user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @voice = Voice.find(params[:id])
    if @voice.update(voice_params)
    redirect_to user_path(current_user.id), notice: "更新しました"
    else
      render 'edit'
    end  
  end
  
  def destroy
    @voice = Voice.find(params[:id])
    @voice.destroy
    redirect_to user_path(current_user.id), notice: "削除できました"
  end
  
  def ranking
    @all_goodjobs = Voice.find(Goodjob.group(:voice_id).order('count(voice_id)desc').limit(10).pluck(:voice_id))
  end  

    
  
  private
  def voice_params
    params.require(:voice).permit(
      :user,
      :body,
      :image)
  end



end
