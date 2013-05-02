Feature: I would like to be able to upload several images to the examinations.

	Scenario: I upload a small image to a given examination
	
		Given I have the background 
		And I visit an examinations edit page
		When I select an image to upload and upload it
		Then the image should be stored and visible on the page
		
	Scenario: It is allowed to upload only jpg files
	
		Given I have the background
		And I visit an examinations edit page
		When I try to upload a gif file
		Then I should see the error message You can upload only jpg files!
		
	Scenario: Big files are resized during upload
	
		Given I have the background
		And I visit an examinations edit page
		When I try to upload a big picture
		Then it will be resized and a thumbnail is created.
		
	Scenario: Pictures can be deleted
	
		Given I have the background
		And I have a picture
		When I visit the delete picture link
		Then the picture should be deleted
		
	Scenario: Pictures can be viewed in their big form
	
		Given I have the background
		And I have a picture
		When I visit that pictures link
		Then I should see the picture on a separate page
		
	Scenario: The click on the big picture should redirect to the previous page
	
		Given I have the background
		And I have a picture
		When I open the picture from the edit examination view
		And I click on the picture
		Then I should see the edit examination page