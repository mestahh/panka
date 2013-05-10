class Statistic < ActiveRecord::Base
  attr_accessible :guest_id, :allergies, :contraceptive, :diseases, :hormon_treatment, :litres_of_liquid_per_day, :main_problem, :medicines, :possible_reason_of_problem, :problem_appeared, :smoking, :sun_protector, :visited_dermatologist, :vitamins
  belongs_to :guest
end
