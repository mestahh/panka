Given(/^I have an admin$/) do
  @admin = FactoryGirl.create(:user, admin: true, username: 'admin')
end

When(/^I log in with the admin$/) do
  login @admin
end

Then(/^I should see an admin link$/) do
  current_path.should == main_index_path(I18n.locale)
  page.should have_content 'Admin'
end

Given(/^I have a regular user$/) do
  @user = FactoryGirl.create(:user)
end

When(/^I log in with the regular user$/) do
  login(@user)
end

Then(/^I should not see an admin link$/) do
  page.should_not have_content 'Admin'
end

Given(/^I am logged in as an admin$/) do
  @admin = FactoryGirl.create(:user, admin: true)
  login @admin
end

Given(/^there is another user with guests$/) do
  @user = FactoryGirl.create(:user, admin: false, username: 'other')
  @guest1 = FactoryGirl.create(:guest, name: 'Joska', user_id: 1)
  @guest2 = FactoryGirl.create(:guest, name: 'Pista', user_id: 2)
  @guest3 = FactoryGirl.create(:guest, name: 'Jani', user_id: 2)
end

When(/^I click on the guests link$/) do
  visit guests_path
end

Then(/^I should see the other users guests$/) do
  page.should have_content 'Joska'
  page.should have_content 'Jani'
  page.should have_content 'Pista'
end

When(/^the admin visits an edit page of a users guest$/) do
  visit edit_guest_path(:id => @guest2.id)
end

When(/^modifies some guest data$/) do
 fill_in 'guest_name', :with => 'newname'
 click_button 'Edit Guest'
end

Then(/^the changes should be saved\.$/) do
  guest = Guest.find(@guest2.id)
  guest.name.should == 'newname'
end

def login (user) 
  visit login_path(:en)
  fill_in 'username', :with => user.username
  fill_in 'password', :with => user.password
  click_button 'Login'
end

When(/^I visit the all guests page$/) do
  visit guests_path
end

When(/^press delete on another users guest$/) do
  click_link 'guest' + @guest2.id.to_s
end

Then(/^the guest should be deleted$/) do
  Guest.count.should == 2
end

When(/^select the other users guest$/) do
  click_link @guest2.name
end

Then(/^I should see the selected guest$/) do
  current_path.should == guest_path(:id => @guest2.id, :locale => I18n.locale)
end

Given(/^there is another user with guests and examinations$/) do
  @user = FactoryGirl.create(:user, username: 'otheruser')
  @guest = FactoryGirl.create(:guest)
  @exam = FactoryGirl.create(:examination)
end

When(/^I visit the other guests examination$/) do
  visit examination_path(:id => @exam.id)
end

Then(/^I should see the examination$/) do
  page.should have_content 'Nyavaja' 
end
