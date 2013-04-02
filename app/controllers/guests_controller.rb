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

  end

  def create
    guest = Guest.new
    guest.name = params[:name]
    guest.birth = params[:birth]
    guest.mother = params[:mother]
    guest.address = params[:address]
    guest.city = params[:city]
    guest.postal_code = params[:postal_code]
    guest.phone = params[:phone]
    guest.email = params[:email]

    guest.save
    redirect_to main_index_path
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    guest = Guest.find(params[:id])
    guest.name = params[:name]
    guest.birth = params[:birth]
    guest.mother = params[:mother]
    guest.address = params[:address]
    guest.city = params[:city]
    guest.postal_code = params[:postal_code]
    guest.phone = params[:phone]
    guest.email = params[:email]

    guest.save
    redirect_to guest_path(:id => guest.id)
  end

  def destroy
    guest = Guest.find(params[:id])
    guest.delete
    redirect_to guests_path
  end

end
