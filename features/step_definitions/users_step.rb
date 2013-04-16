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

When(/^I visit the edit user page$/) do
  visit edit_user_path(:id => @user.id)
end

When(/^change the user data$/) do
 fill_in 'user_username', :with => 'changedusername'
 fill_in 'user_password', :with => 'hallo'
 fill_in 'user_password_confirmation', :with => 'hallo'
 fill_in 'user_email', :with => 'changedemail@email.hu'
 click_button 'Edit'
end

Then(/^the changed user data should be saved$/) do
  @changed_user = User.find(@user.id)
  @changed_user.username.should == 'changedusername'
  @changed_user.email.should == 'changedemail@email.hu'
  click_link 'Log out'
  login_with('changedusername', 'hallo')
  current_path.should == main_index_path(I18n.locale)
end

def login_with(username, password) 
  visit login_path
  fill_in 'username', :with => username
  fill_in 'password', :with => password
  click_button 'Login'
end

When(/^I visit the other users edit page$/) do
  visit edit_user_path(:id => @user2.id)
end

Then(/^I should be redirected to the main page$/) do
 current_path.should == main_index_path(I18n.locale)
end
