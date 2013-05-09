Given(/^I have a comment on an examination$/) do
  comment1 = FactoryGirl.create(:comment)
end

When(/^I delete that comment$/) do
  page.should have_content 'blabla'
  click_link 'Delete comment'
end

Then(/^the comment should be deleted and non\-visible$/) do
  page.should_not have_content 'blabla'
  Comment.count.should == 0
end

When(/^I put a comment on that$/) do
  fill_in 'comment_content', :with => 'my comment'
  click_button 'Comment'
end

Then(/^my comment should be saved and displayed\.$/) do
  Comment.count.should == 1
  comment = Comment.find(1)
  comment.commentable_id.should == @exam1_1_1.id
  current_path.should == examination_path(I18n.locale, :id => @exam1_1_1.id)
  page.should have_content 'my comment'
end


