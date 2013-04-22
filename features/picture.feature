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