When(/^I am adding a new guest to the database$/) do
  visit new_guest_path
  fill_in 'name', :with => 'Kovacs Janos'
  fill_in 'birth', :with => '1956.03.44'
  fill_in 'mothers_name', :with => 'Szabo Anna'
  fill_in 'address', :with => 'Hallo utca 20.'
  fill_in 'city', :with => 'Tata'
  fill_in 'postal_code', :with => '2890'
  fill_in 'phone', :with => '06305554534'
  fill_in 'mail', :with => 'k.j@email.com'
  click_button 'Add guest'
end

Then(/^the new guest should be stored$/) do
  Guest.count.should == 1
end