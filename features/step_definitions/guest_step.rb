When(/^I am adding a new guest to the database$/) do
  visit new_guest_path
  fill_in 'guest_name', :with => 'Kovacs Janos'
  fill_in 'guest_birth', :with => '1956.03.25'
  fill_in 'guest_mother', :with => 'Szabo Anna'
  fill_in 'guest_address', :with => 'Hallo utca 20.'
  fill_in 'guest_city', :with => 'Tata'
  fill_in 'guest_postal_code', :with => '2890'
  fill_in 'guest_phone', :with => '06305554534'
  fill_in 'guest_email', :with => 'k.j@email.com'
  click_button 'Add guest'
end

Then(/^the new guest should be stored$/) do
  current_path.should == main_index_path(I18n.locale)
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
  fill_in 'guest_name', :with => 'Kovacs Bela'
  fill_in 'guest_birth', :with => '1956.05.25'
  fill_in 'guest_mother', :with => 'Szabo Eva'
  fill_in 'guest_address', :with => 'Hallo utca 22.'
  fill_in 'guest_city', :with => 'Tatabanya'
  fill_in 'guest_postal_code', :with => '2900'
  fill_in 'guest_phone', :with => '06205554535'
  fill_in 'guest_email', :with => 'k.j@gmail.com'
  click_button 'Edit'
end

Then(/^the new values should be stored$/) do
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

When(/^search for his name$/) do
  fill_in 'search_field', :with => 'Bo'
  click_button 'Search'
end

When(/^I visit the page for displaying all guests$/) do
  visit guests_path
end

Given(/^I have two guests with the same name and another different one$/) do
  @guest1 = FactoryGirl.create(:guest)
  @guest2 = FactoryGirl.create(:guest, mother: 'Kovacs Klari')
  @guest3 = FactoryGirl.create(:guest, name: 'Tim')
end

Then(/^I should see the all guests page with the matching guests\.$/) do
  current_path.should == guests_path(I18n.locale)
  page.should have_content 'Szabo Klari'
  page.should have_content 'Kovacs Klari'
  page.should_not have_content 'Tim'
end

When(/^click on the delete guest link$/) do
  click_link 'Delete guest'
end

Then(/^the guest should be removed from the database$/) do
  Guest.count.should == 0
end

Then(/^I should see the all guests page$/) do
  current_path.should == guests_path(I18n.locale)
end

When(/^I try to search for an empty guestname$/) do
  visit guests_path
  click_button 'Search'
end

When(/^search for a non\-existing name$/) do
  fill_in 'search_field', :with => 'Mo'
  click_button 'Search'
end

Then(/^I should see an error message about the unsuccessful search$/) do
  page.should have_content 'There is no guest with this name.'
end

When(/^I visit the guests page in select mode$/) do
  visit guests_path(I18n.locale, :mode => 'select', :from => new_examination_path)
end

When(/^click on a guests name$/) do
  click_link 'Bob'
end

Then(/^I should see the new examination page with the guest id$/) do
  current_path.should == new_examination_path(I18n.locale)
end