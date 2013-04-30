class AddAllergiesToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :allergies, :string
  end
end
