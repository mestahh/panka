module GuestsHelper
  def get_guest_name_link_or_selector(guest)
    unless (params[:mode])
      link_to guest.name, guest_path(:id => guest.id)
    else
      link_to guest.name, new_examination_path(:guest_id => guest.id)
    end
  end

  def statistic_link(guest)
    unless guest.statistic
      link_to 'Statistics', new_statistic_path(:guest_id => guest.id)
    else
      link_to 'Statistics', edit_statistic_path(:guest_id => guest.id, :id => guest.statistic.id)
    end
  end

  def vip_class
    if @guest.vip
      'ui-state-highlight noborder'
    end
  end
end
