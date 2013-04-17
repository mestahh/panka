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
    unless (params[:id].to_s == session[:user].to_s)
      redirect_to main_index_path, :alert => 'You are not allowed to view this page'
    else
      @user = User.find(params[:id])
    end
  end

  def update

    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to main_index_path

  end

  protected

  def logged_in
    if (session[:user])
      redirect_to main_index_path, :alert => 'You are not allowed to register!'
    end
  end

end