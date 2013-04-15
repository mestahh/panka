class UsersController < ApplicationController

  before_filter :logged_in, :only => :create
  before_filter :logged_in, :only => :new
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

  def edit
    @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to main_index_path

  end

  protected

  def logged_in
    if (session[:user])
      redirect_to main_index_path
    end
  end

end