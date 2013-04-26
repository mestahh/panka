Given(/^I visit the register page$/) do
  visit new_user_path
end

Given(/^enter valid new user data$/) do
  fill_in 'user_username', :with => 'bali'
  fill_in 'user_email', :with => 'todd@gmail.com'
  fill_in 'user_password', :with => '1'
  fill_in 'user_password_confirmation', :with => '1'
  select 'en', :from => 'user_language'
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
  visit edit_user_path(:id => @user1.id)
end

When(/^change the user data$/) do
  fill_in 'user_username', :with => 'changedusername'
  fill_in 'user_password', :with => 'hallo'
  fill_in 'user_password_confirmation', :with => 'hallo'
  fill_in 'user_email', :with => 'changedemail@email.hu'
  select 'hu', :from => 'user_language'
  click_button 'Edit'
end

Then(/^the changed user data should be saved$/) do
  @changed_user = User.find(@user1.id)
  @changed_user.username.should == 'changedusername'
  @changed_user.email.should == 'changedemail@email.hu'
  @changed_user.language.should == 'hu'
  I18n.locale.should == :hu
  click_link "Kijelentkezes"
  login_with('changedusername', 'hallo')
  current_path.should == main_index_path(:hu)
end

def login_with(username, password)
  visit login_path(:en)
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

When(/^I click on the account link$/) do
  click_link 'My account'
end

Then(/^I should see the edit user page$/) do
  current_path.should == edit_user_path(:id => @user1.id, :locale => I18n.locale)
end

Given(/^I have a user with magyar as the selected language$/) do
  @magyar_user = FactoryGirl.create(:user, language: 'hu');
end

Given(/^I log in with that user$/) do
  login_with(@magyar_user.username, @magyar_user.password)
end

Then(/^I should see the main page with hu locale$/) do
  I18n.locale.should == :hu
  current_path.should == main_index_path(I18n.locale)
end

When(/^I change the user data and the email is empty$/) do
  fill_in 'user_username', :with => 'changedusername'
  fill_in 'user_password', :with => 'hallo'
  fill_in 'user_password_confirmation', :with => 'hallo'
  fill_in 'user_email', :with => ''
  select 'hu', :from => 'user_language'
  click_button 'Edit'
end

Then(/^I should see the edit page and the error message: (.*)$/) do |message|
  current_path.should == edit_user_path(I18n.locale, :id => @user1.id)
  page.should have_content message
end

When(/^I change the user data and the username is empty$/) do
  fill_in 'user_username', :with => ''
  fill_in 'user_password', :with => 'hallo'
  fill_in 'user_password_confirmation', :with => 'hallo'
  fill_in 'user_email', :with => 'm@t.hu'
  select 'hu', :from => 'user_language'
  click_button 'Edit'
end

