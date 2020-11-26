class HomesController < ApplicationController
  before_action :authenticate_user!, except: %i[top about]
  def top; end

  def about; end
end
