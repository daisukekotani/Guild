class PostCommentsController < ApplicationController
  before_action :set_post_comment
  
  def create
    voice = Voice.find(params[:voice_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.voice_id = voice.id
    @post_comment.save
    redirect_to request.referer
  end
  
  def destroy
    PostComment.find_by(id: params[:id], voice_id: params[:voice_id]).destroy
    redirect_to request.referer
  end  
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
   private
  def set_post_comment
    @voice = Voice.find(params[:voice_id])
  end
  
end
