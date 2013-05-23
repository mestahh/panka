module GuestsHelper
  def get_guest_name_link_or_selector(guest)
    unless (params[:mode])
      link_to guest.name, guest_path(:id => guest.id)
    else
      link_to guest.name, new_examination_path(:guest_id => guest.id)
    end
  end
end
