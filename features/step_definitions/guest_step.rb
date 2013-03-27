When(/^I am adding a new guest to the database$/) do
  visit addguest_path
  fill_in 'name', :with => 'Kovacs Janos'
  fill_in 'birth', :with => '1956.03.25'
  fill_in 'mother', :with => 'Szabo Anna'
  fill_in 'address', :with => 'Hallo utca 20.'
  fill_in 'city', :with => 'Tata'
  fill_in 'postal_code', :with => '2890'
  fill_in 'phone', :with => '06305554534'
  fill_in 'email', :with => 'k.j@email.com'
  click_button 'Add guest'
end

Then(/^the new guest should be stored$/) do
  Guest.count.should == 1
  guest = Guest.find_by_name 'Kovacs Janos'
  guest.name.should == 'Kovacs Janos'
  guest.birth.should == '1956.03.25.'.to_date
  guest.mother.should == 'Szabo Anna'
  guest.address.should == 'Hallo utca 20.'
  guest.city.should == 'Tata'
  guest.postal_code.should == 2890
  guest.phone.should == '06305554534'
  guest.email.should == 'k.j@email.com'
end

Given(/^I have a guest$/) do
  @guest = FactoryGirl.create(:guest)
end

When(/^I visit the guests page$/) do
  visit guest_path(:id => @guest.id)
end

Then(/^I should see the details about the guest\.$/) do
  page.should have_content 'Bob'
end

When(/^I visit the guests edit page$/) do
  visit edit_guest_path(:id => @guest.id)
end

When(/^change the values$/) do
  fill_in 'name', :with => 'Kovacs Bela'
  fill_in 'birth', :with => '1956.05.25'
  fill_in 'mother', :with => 'Szabo Eva'
  fill_in 'address', :with => 'Hallo utca 22.'
  fill_in 'city', :with => 'Tatabanya'
  fill_in 'postal_code', :with => '2900'
  fill_in 'phone', :with => '06205554535'
  fill_in 'email', :with => 'k.j@gmail.com'
  click_button 'Edit'
end

Then(/^I the new values should be stored$/) do
  guest = Guest.find(@guest.id)
  guest.name.should == 'Kovacs Bela'
  guest.birth.should == '1956.05.25.'.to_date
  guest.mother.should == 'Szabo Eva'
  guest.address.should == 'Hallo utca 22.'
  guest.city.should == 'Tatabanya'
  guest.postal_code.should == 2900
  guest.phone.should == '06205554535'
  guest.email.should == 'k.j@gmail.com'
end