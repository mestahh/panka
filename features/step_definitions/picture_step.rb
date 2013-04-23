Given(/^I visit an examinations edit page$/) do
  visit edit_examination_path(:id => @exam1_1_1)
end

When(/^I select an image to upload and upload it$/) do
  attach_file('exam_image_exam_image', 'features/img/test_small.jpg')
  click_button 'Upload'
end

Then(/^the image should be stored and visible on the page$/) do
  ExamImage.count.should == 1
  File.open("public/uploads/exam_image/image/1/test_small.jpg").should_not == nil
  #removing the file for the next test
  File.delete("public/uploads/exam_image/image/1/test_small.jpg")
end

When(/^I try to upload a gif file$/) do
  attach_file('exam_image_exam_image', 'features/img/test_small.gif')
  click_button 'Upload'
end

When(/^I try to upload a big picture$/) do
  attach_file('exam_image_exam_image', 'features/img/test_big.jpg')
  click_button 'Upload'
end

Then(/^it will be resized and a thumbnail is created\.$/) do
  ExamImage.count.should == 1
  file =  File.open("public/uploads/exam_image/image/1/test_big.jpg")
  file.should_not == nil
  file.size.should < 1000000
  thumb = File.open("public/uploads/exam_image/image/1/thumb_test_big.jpg")
  thumb.should_not == nil
  
  File.delete("public/uploads/exam_image/image/1/test_big.jpg")
  File.delete("public/uploads/exam_image/image/1/thumb_test_big.jpg")
end