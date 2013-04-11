Given(/^I visit the register page$/) do
  visit new_user_path
end

Given(/^enter valid new user data$/) do
  fill_in 'user_username', :with => 'bali'
  fill_in 'user_email', :with => 'todd@gmail.com'
  fill_in 'user_password', :with => '1'
  fill_in 'user_password_confirmation', :with => '1'
end

When(/^I press the register button$/) do
  click_button 'Register'
end

Then(/^the new user should be created$/) do
  current_path.should == login_path(I18n.locale)
  User.count.should == 1
end

Given(/^enter new user data with not matching passwords$/) do
  fill_in 'user_username', :with => 'bali'
  fill_in 'user_email', :with => 'todd@gmail.com'
  fill_in 'user_password', :with => '1'
  fill_in 'user_password_confirmation', :with => '2'
end

Given(/^enter new user data with an existing username$/) do
  fill_in 'user_username', :with => 'bob'
  fill_in 'user_email', :with => 'todd@gmail.com'
  fill_in 'user_password', :with => '1'
end

Then(/^I should see the register page$/) do
  current_path.should == new_user_path(I18n.locale)
end

Then(/^no user should be created$/) do
  User.count.should == 0
end

Then(/^no new user should be created$/) do
  User.count.should == 1
end

When(/^I click on the registration link$/) do
  click_link 'Registration'
end

When(/^I visit the registration page$/) do
  visit new_user_path
end