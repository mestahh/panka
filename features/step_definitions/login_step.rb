Given(/^I visit the login page$/) do
  visit login_path
end

Given(/^I have a user$/) do
	@user = FactoryGirl.create(:user)
end

Given(/^I visit the page$/) do
  visit "/"
end

Given(/^enter the correct credentials$/) do
  fill_in 'username', :with => @user.username
  fill_in 'password', :with => @user.password
end

When(/^I click the login button$/) do
  click_button 'Login'
end

Then(/^I should see the main page$/) do
  page.should have_content 'Welcome'
end

Given(/^enter the correct username$/) do
  fill_in 'username', :with => @user.username
end

Given(/^enter the wrong password$/) do
  fill_in 'password', :with => 'wrong'
end

Then(/^I should see the login page$/) do
  page.should have_content 'Login'
end

Then(/^I should see an error message$/) do
  page.should have_content 'Wrong'
end

Given(/^enter a non\-existing username$/) do
  fill_in 'username', :with => 'notbob'
end

Given(/^enter a password$/) do
  fill_in 'password', :with => @user.password
end

Given(/^I am logged in$/) do
  @user = FactoryGirl.create(:user)
  visit '/login'
  fill_in 'username', :with => @user.username
  fill_in 'password', :with => @user.password
  click_button 'Login'
end

When(/^I click on the logout link$/) do
  click_link 'Log out'
end


