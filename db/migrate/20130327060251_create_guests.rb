class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.text :name
      t.date :birth
      t.text :mother
      t.text :address
      t.text :city
      t.integer :postal_code
      t.text :phone
      t.text :email

      t.timestamps
    end
  end
end
