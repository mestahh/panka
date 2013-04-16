class ExaminationsController < ApplicationController
  before_filter :check_login
  def index

    if (params[:guest_id])
      @examinations = Examination.paginate :page => params[:page], :per_page => 20, :conditions => [ 'user_id = ? and guest_id = ?', session[:user], params[:guest_id]]
    else
      @examinations = Examination.paginate :page => params[:page], :per_page => 20, :conditions => [ 'user_id = ?', session[:user]]
    end
  end

  def new

    begin
      if (params[:guest_id])
        Guest.find(params[:guest_id])
      end
      @examination = Examination.new
      @guest_id = params[:guest_id]
    rescue
      redirect_to main_index_path
    end

  end

  def show
    @examination = Examination.find(params[:id]);
    if (@examination.guest.user_id != session[:user])
      redirect_to main_index_path
    end
  end

  def create
    examination = Examination.new(params[:examination])
    examination.user_id = session[:user]
    if examination.save
      redirect_to guest_path(:id => examination.guest.id)
    else
      redirect_to new_examination_path
    end

  end

  def destroy
    examination = Examination.find(params[:id])
    examination.delete
    redirect_to guest_path(:id => examination.guest.id)
  end

  def edit
    @examination = Examination.find(params[:id])
    if (@examination.guest.user_id != session[:user])
      redirect_to main_index_path
    end
  end

  def update
    exam = Examination.find(params[:id])

    if exam.update_attributes(params[:examination])
      redirect_to guest_path(:id => exam.guest.id)
    else
      redirect_to edit_examination_path(:id => params[:id])
    end
  end

end
