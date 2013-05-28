When(/^I click on the statistics link$/) do
  click_link 'Statistics'
end

When(/^fill in the statistical data and submit it$/) do
  fill_in 'statistic_allergies', :with => 'mogyoroallergia'
  fill_in 'statistic_diseases', :with => 'nincs'
  fill_in 'statistic_medicines', :with => 'algopyrin'
  fill_in 'statistic_vitamins', :with => 'C vitamin'
  uncheck 'statistic_hormon_treatment'
  check 'statistic_smoking'
  fill_in 'statistic_litres_of_liquid_per_day', :with => 2
  check 'statistic_sun_protector'
  fill_in 'statistic_main_problem', :with => 'Nagyon szaraz'
  fill_in 'statistic_problem_appeared', :with => 'fel eve'
  fill_in 'statistic_possible_reason_of_problem', :with => 'nem kenem'
  fill_in 'statistic_visited_dermatologist', :with => 'volt es jo volt'
  click_button 'Add Statistic'
end

When(/^change the statistical data and submit it$/) do
  fill_in 'statistic_allergies', :with => 'mogyoroallergia'
  fill_in 'statistic_diseases', :with => 'nincs'
  fill_in 'statistic_medicines', :with => 'algopyrin'
  fill_in 'statistic_vitamins', :with => 'C vitamin'
  uncheck 'statistic_hormon_treatment'
  check 'statistic_smoking'
  fill_in 'statistic_litres_of_liquid_per_day', :with => 2
  check 'statistic_sun_protector'
  fill_in 'statistic_main_problem', :with => 'Nagyon szaraz'
  fill_in 'statistic_problem_appeared', :with => 'fel eve'
  fill_in 'statistic_possible_reason_of_problem', :with => 'nem kenem'
  fill_in 'statistic_visited_dermatologist', :with => 'volt es jo volt'
  click_button 'Edit Statistic'
end

Then(/^a statistics data should be stored\.$/) do
  stat = Statistic.find(@guest1_1.statistic.id)
  stat.allergies.should == 'mogyoroallergia'
  stat.diseases.should == 'nincs'
  stat.medicines.should == 'algopyrin'
  stat.vitamins.should == 'C vitamin'
  stat.hormon_treatment.should == false
  stat.smoking.should == true
  stat.litres_of_liquid_per_day.should == 2
  stat.sun_protector.should == true
  stat.main_problem.should == 'Nagyon szaraz'
  stat.problem_appeared.should == 'fel eve'
  stat.possible_reason_of_problem.should == 'nem kenem'
  stat.visited_dermatologist.should == "volt es jo volt"
end

Given(/^I have a guest with statistical data$/) do
  stat = FactoryGirl.create(:statistic)
  stat.guest_id = @guest1_1.id
  stat.save
  @guest1_1.statistic.should == stat
end

Then(/^a statistics data should be changed\.$/) do
  stat = Statistic.find(@guest1_1.statistic.id)
  stat.allergies.should == 'mogyoroallergia'
  stat.diseases.should == 'nincs'
  stat.medicines.should == 'algopyrin'
  stat.vitamins.should == 'C vitamin'
  stat.hormon_treatment.should == false
  stat.smoking.should == true
  stat.litres_of_liquid_per_day.should == 2
  stat.sun_protector.should == true
  stat.main_problem.should == 'Nagyon szaraz'
  stat.problem_appeared.should == 'fel eve'
  stat.possible_reason_of_problem.should == 'nem kenem'
  stat.visited_dermatologist.should == "volt es jo volt"
end

When(/^I visit the add guest page$/) do
  visit new_guest_path
end

When(/^fill in the form$/) do
  fill_in_new_guest
end

When(/^I click on the add statistic button$/) do
  click_button 'Add Statistic'
end

Then(/^the guest should be saved$/) do
  Guest.count.should == 7
end

Then(/^the new statistic page should be shown$/) do
  current_path.should == new_statistic_path(I18n.locale)
end