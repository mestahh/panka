Feature: Examination

	A guest can have 0...n examination. An examination
	belongs to the guest. The user should be able to add/remove/delete the examinations.
	
	Scenario: Adding Examination
	
		Given I am logged in
		And I have a guest
		When I click on the add examination link on the guests page
		And fill in all the fields on the examination
		And press the add examination button
		Then I should have a new examination in the database
		And I should see the guests page.
		
	Scenario: List all examinations for a guest
	
		Given I have two guests
		And I have an examination for both guests
	 	When I visit the examinations page for the first guest
		Then I should see the examinations for the first guest.
		
	Scenario: List all examinations if the guest is not specified
		
		Given I have two guests
		And I have an examination for both guests
		When I visit the examinations page without guest parameter
		Then I should see all the examinations for all guests
	
	Scenario: Search for an examination
	
		Given I have two guests
		And I have an examination for both guests
		When I visit the examinations page without guest parameter
		And I enter the dates for the the first examination in the date filters
		And I click on the search button
		Then I should see the first examination listed
		
	Scenario: Search for examinations in a range
	
		Given I have two guests
		And I have an examination for both guests
		When I visit the examinations page without guest parameter
		And I enter the dates for both examinations in the date filters
		And I click on the search button
		Then I should see both examinations listed
		
	Scenario: Examination page can be visited
	
		Given I have a guest
		And I have an examination for that guest
		When I visit that examinations page
		Then I should see the examination details.
	
	Scenario: Edit examination
	
		Given I have a guest
		And I have an examination for that guest
		When I visit that examinations edit page
		And change its values
		And press the edit button
		Then the changes should be saved
		And I should see the changed examination
		
	Scenario: Delete examination
	
		Given I have a guest
		And I have an examination for that guest
		When I visit that examinations page
		And I click on the delete examination link
		Then the examination should be deleted.
		And I should see the guests page