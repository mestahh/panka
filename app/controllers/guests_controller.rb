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

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(params[:guest])
    @guest.user = User.find(session[:user])
    if @guest.save
      redirect_to main_index_path
    else
      @guest.errors.add(:name, "Missing password")
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
