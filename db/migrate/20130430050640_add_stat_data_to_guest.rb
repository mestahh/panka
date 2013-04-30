class AddStatDataToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :diseases, :string
    add_column :guests, :medicines, :string
    add_column :guests, :contraceptive, :boolean
    add_column :guests, :vitamins, :string
    add_column :guests, :hormon_treatment, :boolean
    add_column :guests, :smoking, :boolean
    add_column :guests, :litres_of_liquid_per_day, :number
    add_column :guests, :sun_protector, :boolean
    add_column :guests, :main_problem, :string
    add_column :guests, :problem_appeared, :string
    add_column :guests, :possible_reason_of_problem, :string
    add_column :guests, :visited_dermatologist, :boolean
  end
end
