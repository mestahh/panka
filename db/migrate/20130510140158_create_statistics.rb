class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.integer :guest_id
      t.string :allergies
      t.string :diseases
      t.string :medicines
      t.boolean :contraceptive
      t.string :vitamins
      t.boolean :hormon_treatment
      t.boolean :smoking
      t.float :litres_of_liquid_per_day
      t.boolean :sun_protector
      t.string :main_problem
      t.string :problem_appeared
      t.string :possible_reason_of_problem
      t.string :visited_dermatologist

      t.timestamps
    end
  end
end
