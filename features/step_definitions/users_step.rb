Given(/^I visit the register page$/) do
  visit new_user_path
end

Given(/^enter valid new user data$/) do
  fill_in 'user_username', :with => 'bali'
  fill_in 'user_email', :with => 'todd@gmail.com'
  fill_in 'user_password', :with => '1'
end

When(/^I press the register button$/) do
  click_button 'Register'
end

Then(/^the new user should be created$/) do
  current_path.should == login_path(I18n.locale)
  User.count.should == 1
end