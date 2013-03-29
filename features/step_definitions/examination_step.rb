Given(/^I have an examination for that guest$/) do
  @exam = FactoryGirl.create(:examination)
end

When(/^I visit that examinations page$/) do
  visit examination_path(:id => @exam.id)
end

Then(/^I should see the examination details\.$/) do
  page.should have_content 'Nyavaja'
  page.should have_content 'treatment'
  page.should have_content 'brutal'
  page.should have_content '15000'
end

When(/^I click on the add examination link on the guests page$/) do
  visit guest_path(:id => @guest.id)
  click_link 'Add examination'
end

When(/^fill in all the fields on the examination$/) do
  fill_in 'anamnezis', :with => 'testanamnezis'
  fill_in 'status', :with => 'status'
  fill_in 'treatment', :with => 'treatment'
  fill_in 'charge', :with => 15000
end

When(/^press the add examination button$/) do
  click_button 'Add examination'
end

Then(/^I should have a new examination in the database$/) do
  Examination.count.should == 1
  Examination.find(:all)[0].guest.should == @guest
end

Then(/^I should see the guests page\.$/) do
  current_path.should == guest_path(:id => @guest.id)
end

Given(/^I have two guests$/) do
  @guest = FactoryGirl.create(:guest)
  @another_guest = FactoryGirl.create(:guest, name: 'Tim')
end

Given(/^I have an examination for both guests$/) do
  @exam1 = FactoryGirl.create(:examination)
  @exam2 = FactoryGirl.create(:examination, guest_id: @another_guest.id, anamnezis: 'Korsag')
end

When(/^I visit the examinations page for the first guest$/) do
  visit examinations_path(:guest_id => @guest.id)
end

Then(/^I should see the examinations for the first guest\.$/) do
  page.should have_content 'Nyavaja'
  page.should_not have_content 'Korsag'
end

When(/^I visit the examinations page without guest parameter$/) do
  visit examinations_path
end

Then(/^I should see all the examinations for all guests$/) do
  page.should have_content 'Nyavaja'
  page.should have_content 'Korsag'
end

When(/^I click on the delete examination link$/) do
  click_link 'Delete examination'
end

Then(/^the examination should be deleted\.$/) do
 Examination.count.should == 0
end

Then(/^I should see the guests page$/) do
  current_path.should == guest_path(:id => @guest.id)
end

When(/^I visit that examinations edit page$/) do
  visit edit_examination_path(:id => @exam.id)
end

When(/^change its values$/) do
  fill_in 'anamnezis', :with => 'changedanamnezis'
  fill_in 'status', :with => 'changedstatus'
  fill_in 'treatment', :with => 'changedtreatment'
  fill_in 'charge', :with => 12000
end

When(/^press the edit button$/) do
  click_button 'Edit examination'
end

Then(/^the changes should be saved$/) do
  changed_exam = Examination.find(@exam.id)
  changed_exam.anamnezis.should == 'changedanamnezis'
  changed_exam.status.should == 'changedstatus'
  changed_exam.treatment.should == 'changedtreatment'
  changed_exam.charge.should == 12000
  changed_exam.guest.should == @guest 
end

Then(/^I should see the changed examination$/) do
  current_path.should == guest_path(:id => @guest.id)
end