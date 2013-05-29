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
      render :new
    end

  end

  def edit
    @user = User.find(params[:id])
    

    
    unless @user.id == session[:user] || @user.auth_token == params[:auth_token]
      redirect_to main_index_path, :alert => 'You are not allowed to view this page'
    end
  end

  def update

    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      I18n.locale = @user.language
      redirect_to main_index_path
    else
      #flash[:alert] = @user.errors
      render :edit
    end

  end

  protected

  def logged_in
    if (session[:user])
      redirect_to main_index_path, :alert => 'You are not allowed to register!'
    end
  end

end