class UsersController < ApplicationController

  before_filter :logged_in
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to login_path
    else
      redirect_to new_user_path
    end

  end

  protected

  def logged_in
    if (session[:user])
      redirect_to main_index_path
    end
  end

end