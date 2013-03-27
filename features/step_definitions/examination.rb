Given(/^have a guest$/) do
  @guest = FactoryGirl.create(:guest)
end

When(/^I click on the add examination link on the guests page$/) do
  visit guest_path(:id => @guest.id)
  click_link 'Add examination'
end

When(/^fill in all the fields on the examination$/) do
 	fill_in 'anamnezis', :with => 'testanamnezis'
 	fill_in 'status', :with => 'status'
 	fill_in 'treatment', :with => 'treatment'
 	fill_in 'charge', :with => 'charge'
end

When(/^press the add examination button$/) do
  click_button 'Add examination'
end

Then(/^I should have a new examination in the database$/) do
  Examination.count.should == 1
end

Then(/^I should see the guests page\.$/) do 
  current_path.should == guest_path(:id => @guest.id)
end