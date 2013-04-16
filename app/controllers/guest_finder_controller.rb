class GuestFinderController < ApplicationController
  

  
  def search
    if params[:search_field] == ''
      @guests = []
      return
    end

    @guests = Guest.search(params[:search_field], session[:user])

    if @guests.size == 0
      flash[:alert] = 'There is no guest with this name.'
      return
    end
  end
end
