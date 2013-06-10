class GuestsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :check_login
  
  def index
    flash[:alert] = nil
    @guests = Guest.paginate :page => params[:page], :order => sort_column + " " + sort_direction, :per_page => 20, :conditions => user_conditions
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(params[:guest])
    @guest.user = User.find(session[:user])

    if @guest.save
      if (params[:commit] == 'Add Statistic')
        redirect_to new_statistic_path(:guest_id => @guest.id), :notice => 'Guest stored.'
      else
        redirect_to new_examination_path(:guest_id => @guest.id), :notice => 'Guest stored.'
      end
    else
      render :new
    end
  end

  def show
    @guest = get_guest(params)
    @comment = Comment.new
    if @guest.nil?
      redirect_to main_index_path, :alert => 'You are not allowed to view this page!'
    return
    end
  end

  def edit
    @guest = get_guest(params)

    if @guest.nil?
      redirect_to main_index_path, :alert => 'You are not allowed to view this page!'
    return
    end
  end

  def update
    guest = Guest.find(params[:id])

    if guest.update_attributes(params[:guest])
      flash[:notice] = 'Guest data changed.'
      redirect_to guest_path :id => guest.id
    else
      redirect_to edit_guest_path(:id => guest.id)
    end
  end

  def destroy
    guest = get_guest(params)

    if guest.nil?
      redirect_to main_index_path
      return
    end
    guest.delete
    redirect_to guests_path, :notice => 'Guest deleted.'
  end

  private

  def get_guest(params)
    user = User.find(session[:user])
    if (user.admin == true)
      Guest.find(params[:id])
    else
      Guest.find_by_id_and_user_id(params[:id], session[:user])
    end
  end

  def sort_column
    Guest.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def user_conditions
    @user = User.find(session[:user])
    if @user.admin
    return []
    else
      [ 'user_id = ?', session[:user]]
    end
  end
end
