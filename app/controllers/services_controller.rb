class ServicesController < ApplicationController
  respond_to :json
  def mark_vip
    respond_to do |format|
      guest = Guest.find(params[:guest_id])
      if guest.vip
        guest.vip = false
      else
        guest.vip = true
      end
      guest.save
      format.json { render :json =>{:result => "ok"}}
    end
  end
end
