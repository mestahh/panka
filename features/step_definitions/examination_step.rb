When(/^I visit that examinations page$/) do
  visit examination_path(:id => @exam1_1_1.id)
end

Then(/^I should see the examination details\.$/) do
  page.should have_content @exam1_1_1.anamnezis
  page.should have_content @exam1_1_1.treatment
  page.should have_content @exam1_1_1.status
  page.should have_content @exam1_1_1.charge
end

When(/^I click on the add examination link on the guests page$/) do
  visit guest_path(:id => @guest1_1.id)
  click_link 'Add examination'
end

When(/^fill in all the fields on the examination$/) do
  fill_in 'examination_anamnezis', :with => 'testanamnezis'
  fill_in 'examination_status', :with => 'status'
  fill_in 'examination_treatment', :with => 'treatment'
  fill_in 'examination_charge', :with => 15000
end

When(/^press the add examination button$/) do
  click_button 'Add Examination'
end

Then(/^I should have a new examination in the database$/) do
  Examination.count.should == 19
  exam = Examination.find_by_anamnezis('testanamnezis')
  exam.user_id.should == @user1.id
end

Then(/^I should see the guests page\.$/) do
  current_path.should == guest_path(I18n.locale, :id => @guest1_1.id)
end

When(/^I visit the examinations page for the first guest$/) do
  visit examinations_path(:guest_id => @guest1_1.id)
end

Then(/^I should see the examinations for the first guest\.$/) do
  page.should have_content @exam1_1_1.anamnezis
  page.should have_content @exam1_1_2.anamnezis
  page.should have_content @exam1_1_3.anamnezis

  page.should_not have_content @exam1_2_1.anamnezis
  page.should_not have_content @exam1_2_2.anamnezis
  page.should_not have_content @exam1_2_3.anamnezis

  page.should_not have_content @exam1_3_1.anamnezis
  page.should_not have_content @exam1_3_2.anamnezis
  page.should_not have_content @exam1_3_3.anamnezis

  page.should_not have_content @exam2_1_1.anamnezis
  page.should_not have_content @exam2_1_2.anamnezis
  page.should_not have_content @exam2_1_3.anamnezis

  page.should_not have_content @exam2_2_1.anamnezis
  page.should_not have_content @exam2_2_2.anamnezis
  page.should_not have_content @exam2_2_3.anamnezis

  page.should_not have_content @exam2_3_1.anamnezis
  page.should_not have_content @exam2_3_2.anamnezis
  page.should_not have_content @exam2_3_3.anamnezis
end

When(/^I visit the examinations page without guest parameter$/) do
  visit examinations_path
end

Then(/^I should see all the examinations for all guests$/) do
  page.should have_content @exam1_1_1.anamnezis
  page.should have_content @exam1_1_1.anamnezis
  page.should have_content @exam1_1_1.anamnezis

  page.should have_content @exam1_2_1.anamnezis
  page.should have_content @exam1_2_2.anamnezis
  page.should have_content @exam1_2_3.anamnezis

  page.should have_content @exam1_3_1.anamnezis
  page.should have_content @exam1_3_2.anamnezis
  page.should have_content @exam1_3_3.anamnezis

  page.should_not have_content @exam2_1_1.anamnezis
  page.should_not have_content @exam2_1_2.anamnezis
  page.should_not have_content @exam2_1_3.anamnezis

  page.should_not have_content @exam2_2_1.anamnezis
  page.should_not have_content @exam2_2_2.anamnezis
  page.should_not have_content @exam2_2_3.anamnezis

  page.should_not have_content @exam2_3_1.anamnezis
  page.should_not have_content @exam2_3_2.anamnezis
  page.should_not have_content @exam2_3_3.anamnezis
end

When(/^I click on the delete examination link$/) do
  click_link 'Delete examination'
end

Then(/^the examination should be deleted\.$/) do
  Examination.count.should == 17
end

Then(/^I should see the guests page$/) do
  current_path.should == guest_path(I18n.locale, :id => @guest1_1.id)
end

When(/^I visit that examinations edit page$/) do
  visit edit_examination_path(:id => @exam1_1_1.id)
end

When(/^change its values$/) do
  fill_in 'examination_anamnezis', :with => 'changedanamnezis'
  fill_in 'examination_status', :with => 'changedstatus'
  fill_in 'examination_treatment', :with => 'changedtreatment'
  fill_in 'examination_charge', :with => 12000
end

When(/^press the edit button$/) do
  click_button 'Edit Examination'
end

Then(/^the changes should be saved$/) do
  changed_exam = Examination.find(@exam1_1_1.id)
  changed_exam.anamnezis.should == 'changedanamnezis'
  changed_exam.status.should == 'changedstatus'
  changed_exam.treatment.should == 'changedtreatment'
  changed_exam.charge.should == 12000
  changed_exam.guest.should == @guest1_1
end

Then(/^I should see the changed examination$/) do
  current_path.should == guest_path(I18n.locale, :id => @guest1_1.id)
end

When(/^I enter the dates for the the first examination in the date filters$/) do
  @exam1_1_1.created_at = '2012-12-12 12:12:12'
  @exam1_1_1.save
  fill_in 'from_date', :with => '2012-12-11'
  fill_in 'to_date', :with => '2012-12-13'
end

When(/^I click on the search button$/) do
  click_button 'Search'
end

Then(/^I should see the first examination listed$/) do
  current_path.should == search_exam_path(I18n.locale)
  page.should have_content 'Nyavaja'
  page.should_not have_content 'Korsag'
end

Then(/^I should see both examinations listed$/) do
  current_path.should == search_exam_path(I18n.locale)
  page.should have_content 'Nyavaja'
  page.should have_content 'Korsag'
end

When(/^I enter the dates for both examinations in the date filters$/) do
  @exam1_1_1.created_at = '2012-12-12 12:12:12'
  @exam1_1_2.created_at = '2012-11-12 12:12:12'
  @exam1_1_1.save
  @exam1_1_2.save
  fill_in 'from_date', :with => '2012-11-11'
  fill_in 'to_date', :with => '2012-12-13'
end

When(/^I click on the add examination menu item$/) do
  visit new_examination_path
end

When(/^click on the select guest button$/) do
  click_link 'Select guest'
end

Then(/^I should see the select guest page\.$/) do
  current_path.should == guests_path(I18n.locale)
end

Given(/^I visit the new examination page with a guest parameter$/) do
  visit new_examination_path(:guest_id => @guest1_1.id)
end

Then(/^I should not see the select guest link$/) do
  page.should_not have_content 'Select guest'
end

When(/^I visit the other examinations page$/) do
  visit examination_path(:id => @exam2_1_1.id)
end

When(/^I visit the other examinations delete link$/) do
  visit examination_path(:id => @exam2_1_1.id, :method => 'delete')
end

When(/^I visit the other examinations edit link$/) do
  visit edit_examination_path(:id => @exam2_1_1.id)
end
When(/^I visit the examinations page$/) do
  visit examinations_path
end

Then(/^I should see only my user's examinations$/) do
  page.should have_content 'Nyavaja'
  page.should have_content 'Korsag'
  page.should have_content 'Fene'

  page.should have_content 'Ludborzes'
  page.should have_content 'Bibircsok'
  page.should have_content 'Hidegrazas'

  page.should have_content 'Pestis'
  page.should have_content 'Himlo'
  page.should have_content 'Szemmelveres'

  page.should_not have_content 'Franc'
  page.should_not have_content 'Sargasag'
  page.should_not have_content 'Sapkor'

  page.should_not have_content 'Agybaj'
  page.should_not have_content 'Reuma'
  page.should_not have_content 'Gumokor'

  page.should_not have_content 'Agylagyulas'
  page.should_not have_content 'Szifilisz'
  page.should_not have_content 'Atok'
end

When(/^I visit the new examination page with non\-existing guest id$/) do
  visit new_examination_path(:guest_id => '123')
end