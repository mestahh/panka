class GuestsController < ApplicationController
  def index
    if (params[:query])
      @guests = Guest.search(params[:query])
    else
      @guests = Guest.find(:all)
    end
  end

  def search
    if params[:search_field] == ''
      redirect_to guests_path
    return
    end

    @guest = Guest.search(params[:search_field])

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

    if guest.save
      redirect_to main_index_path
    else
      redirect_to new_guest_path
    end
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def edit
    @guest = Guest.find(params[:id])
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
    guest = Guest.find(params[:id])
    guest.delete
    redirect_to guests_path
  end

end
