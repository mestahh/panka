Given(/^I have the background$/) do
  @user1 = FactoryGirl.create(:user)
  @user2 = FactoryGirl.create(:user, username: 'Tim')

  @guest1_1 = FactoryGirl.create(:guest, name: 'Marika', user_id: @user1.id)
  @guest1_2 = FactoryGirl.create(:guest, name: 'Pista A', birth: '1982-07-07', user_id: @user1.id)
  @guest1_3 = FactoryGirl.create(:guest, name: 'Pista K', birth: '1983-06-09', user_id: @user1.id)

  @guest2_1 = FactoryGirl.create(:guest, name: 'Jani', user_id: @user2.id)
  @guest2_2 = FactoryGirl.create(:guest, name: 'Juli', birth: '1982-07-07', user_id: @user2.id)
  @guest2_3 = FactoryGirl.create(:guest, name: 'Juli', birth: '1983-06-09', user_id: @user2.id)

  @exam1_1_1 = FactoryGirl.create(:examination, guest_id: @guest1_1.id, user_id: @user1.id, anamnezis: 'Nyavaja')
  @exam1_1_2 = FactoryGirl.create(:examination, guest_id: @guest1_1.id, user_id: @user1.id, anamnezis: 'Korsag')
  @exam1_1_3 = FactoryGirl.create(:examination, guest_id: @guest1_1.id, user_id: @user1.id, anamnezis: 'Fene')

  @exam1_2_1 = FactoryGirl.create(:examination, guest_id: @guest1_2.id, user_id: @user1.id, anamnezis: 'Ludborzes')
  @exam1_2_2 = FactoryGirl.create(:examination, guest_id: @guest1_2.id, user_id: @user1.id, anamnezis: 'Bibircsok')
  @exam1_2_3 = FactoryGirl.create(:examination, guest_id: @guest1_2.id, user_id: @user1.id, anamnezis: 'Hidegrazas')

  @exam1_3_1 = FactoryGirl.create(:examination, guest_id: @guest1_3.id, user_id: @user1.id, anamnezis: 'Pestis')
  @exam1_3_2 = FactoryGirl.create(:examination, guest_id: @guest1_3.id, user_id: @user1.id, anamnezis: 'Himlo')
  @exam1_3_3 = FactoryGirl.create(:examination, guest_id: @guest1_3.id, user_id: @user1.id, anamnezis: 'Szemmelveres')

  @exam2_1_1 = FactoryGirl.create(:examination, guest_id: @guest2_1.id, user_id: @user2.id, anamnezis: 'Franc')
  @exam2_1_2 = FactoryGirl.create(:examination, guest_id: @guest2_1.id, user_id: @user2.id, anamnezis: 'Sargasag')
  @exam2_1_3 = FactoryGirl.create(:examination, guest_id: @guest2_1.id, user_id: @user2.id, anamnezis: 'Sapkor')

  @exam2_2_1 = FactoryGirl.create(:examination, guest_id: @guest2_2.id, user_id: @user2.id, anamnezis: 'Agybaj')
  @exam2_2_2 = FactoryGirl.create(:examination, guest_id: @guest2_2.id, user_id: @user2.id, anamnezis: 'Reuma')
  @exam2_2_3 = FactoryGirl.create(:examination, guest_id: @guest2_2.id, user_id: @user2.id, anamnezis: 'Gumokor')

  @exam2_3_1 = FactoryGirl.create(:examination, guest_id: @guest2_3.id, user_id: @user2.id, anamnezis: 'Agylagyulas')
  @exam2_3_2 = FactoryGirl.create(:examination, guest_id: @guest2_3.id, user_id: @user2.id, anamnezis: 'Szifilisz')
  @exam2_3_3 = FactoryGirl.create(:examination, guest_id: @guest2_3.id, user_id: @user2.id, anamnezis: 'Atok')

  visit '/login'
  fill_in 'username', :with => @user1.username
  fill_in 'password', :with => @user1.password
  click_button 'Login'

end

Then(/^I should see the error message (.*)$/) do |message|
 page.should have_content message
end