Feature: Examination

	A guest can have 0...n examination. An examination
	belongs to the guest. The user should be able to add/remove/delete the examinations.
	
	Scenario: Adding Examination
	
		Given I am logged in
		And have a guest
		When I click on the add examination link on the guests page
		And fill in all the fields on the examination
		And press the add examination button
		Then I should have a new examination in the database
		And I should see the guests page.
		
	Scenario: List all examinations
	
		Given I have a guest
		And I have an examination for that guest 
	 	When I visit the examinations page
		Then I should see the examination for that guest.