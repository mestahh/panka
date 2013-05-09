class AddVipToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :vip, :boolean
  end
end
