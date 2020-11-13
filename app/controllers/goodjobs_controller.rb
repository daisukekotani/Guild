class GoodjobsController < ApplicationController
   before_action :set_goodjob
  
  def create
  voice = Voice.find(params[:voice_id])
  goodjob = current_user.goodjobs.new(voice_id: voice.id)
  goodjob.save
  end
  
  def destroy
  voice = Voice.find(params[:voice_id])
  goodjob = current_user.goodjobs.find_by(voice_id: voice.id)
  goodjob.destroy
  end
  
   private
  def set_goodjob
    @voice = Voice.find(params[:voice_id])
  end
end
