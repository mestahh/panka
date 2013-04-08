class GuestsController < ApplicationController
  
  before_filter :check_login
  
  def index

    @user = User.find(session[:user])

    if (params[:query])
      @guests = Guest.search(params[:query], session[:user])
    else
      @guests = @user.guests
    end
  end
  
  def search_examination
    @examinations = Examination.where(["created_at < ? and created_at > ? and guest_id = ?", params[:from_date], params[:to_date], params[:guest_id]])
    redirect_to guest_path(:id => params[:guest_id])
  end

  def search
    if params[:search_field] == ''
      redirect_to guests_path
    return
    end

    @guest = Guest.search(params[:search_field], session[:user])

    if @guest.size == 0
      redirect_to guests_path, :alert => 'There is no guest with this name.'
    return
    end

    if (@guest.size > 1)
      redirect_to guests_path(:query => params[:search_field])
    else
      redirect_to guest_path(:id => @guest[0].id)
    end
  end

  def new
    @guest = Guest.new
  end

  def create
    guest = Guest.new(params[:guest])
    guest.user = User.find(session[:user])
    if guest.save
      redirect_to main_index_path
    else
      redirect_to new_guest_path
    end
  end

  def show
    @guest = Guest.find_by_id_and_user_id(params[:id], session[:user])
    if (@guest.nil?)
      redirect_to main_index_path
    return
    end
  end

  def edit
    @guest = Guest.find_by_id_and_user_id(params[:id], session[:user])
    if (@guest.nil?)
      redirect_to main_index_path
    return
    end
  end

  def update
    guest = Guest.find(params[:id])

    if guest.update_attributes(params[:guest])
      redirect_to guest_path(:id => guest.id)
    else
      redirect_to edit_guest_path(:id => guest.id)
    end
  end

  def destroy
    @guest = Guest.find_by_id_and_user_id(params[:id], session[:user])
    if (@guest.nil?)
      redirect_to main_index_path
      return
    end
    @guest.delete
    redirect_to guests_path
  end

end
