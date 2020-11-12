class GoodjobsController < ApplicationController
  
  def create
  voice = Voice.find(params[:voice_id])
  goodjob = current_user.goodjobs.new(voice_id: voice.id)
  goodjob.save
  redirect_to request.referer
  end
  
  def destroy
  voice = Voice.find(params[:voice_id])
  goodjob = current_user.goodjobs.find_by(voice_id: voice.id)
  goodjob.destroy
  redirect_to request.referer
  end
  
end
