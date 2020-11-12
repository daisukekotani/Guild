class VoicesController < ApplicationController
  
  def new
    @voice = Voice.new
  end  
  
  def create
    @voice = Voice.new(voice_params)
    @voice.user_id = current_user.id
    @voice.save
    redirect_to user_path(current_user.id)
  end
  
  def index
    @voice = Voice.all
  end
  
  def show
    @voice = Voice.find(params[:id])
    @post_comment = PostComment.new
  end  
  
  def edit
    @voice = Voice.find(params[:id])
  end
  
  def update
    voice = Voice.find(params[:id])
    voice.update(voice_params)
    redirect_to user_path(current_user.id)
  end
  
  def destroy
    @voice = Voice.find(params[:id])
    @voice.destroy
    redirect_to user_path(current_user.id)
  end

    
  
  private
  def voice_params
    params.require(:voice).permit(
      :user,
      :body,
      :image)
  end



end
