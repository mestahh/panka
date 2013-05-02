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
      else
        flash[:alert] = 'Please select a guest first!'
      end

      @examination = Examination.new
      @examination.guest_id = params[:guest_id]
    rescue
      redirect_to main_index_path, :alert => 'There is no guest with this id!'
    end

  end

  def show
    @examination = Examination.find(params[:id]);
    if (@examination.guest.user_id != session[:user])
      redirect_to main_index_path, :alert => 'You can not access this page!'
    end
  end

  def create
    examination = Examination.new(params[:examination])
    examination.user_id = session[:user]
    if examination.save
      redirect_to guest_path(:id => examination.guest.id)
    else
      redirect_to new_examination_path(:guest_id => examination.guest_id)
    end

  end

  def destroy
    examination = Examination.find(params[:id])
    examination.delete
    redirect_to guest_path(:id => examination.guest.id)
  end

  def save_image
    image = ExamImage.new
    image.examination_id = params[:exam_image][:exam_id]
    image.image = params[:exam_image][:exam_image]
    image.caption = params[:exam_image][:caption]
    begin
      image.save!
    rescue
      flash[:alert] = 'You can upload only jpg files!'
    end
    redirect_to edit_examination_path(:id => params[:exam_image][:exam_id])
  end

  def edit
    @examination = Examination.find(params[:id])
    @picture = ExamImage.new
    if (@examination.guest.user_id != session[:user])
      redirect_to main_index_path, :alert => 'You can not access this page!'
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
