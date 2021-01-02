class SearchsController < ApplicationController
  def search
    @range = params[:range]
    search = params[:search]
    word = params[:word]
    if @range == 'user'
      @user = User.search(search, word)
    else
      @voice = Voice.search(search, word)
    end
  end
end
