Feature: Examination

	A guest can have 0...n examination. An examination
	belongs to the guest. The user should be able to add/remove/delete the examinations.
	
	Background:
	
		Given I have the background
	
	Scenario: Creating a new examination for a guest
	
		When I click on the add examination link on the guests page
		And fill in all the fields on the examination
		And press the add examination button
		Then I should have a new examination in the database
		And I should see the guests page.
		
	Scenario: Add examination without a pre-selected guest
	
		When I click on the add examination menu item
		And I click on the select guest button
		Then I should see the select guest page.
		
	Scenario: List all examinations for a guest
	
	 	When I visit the examinations page for the first guest
		Then I should see the examinations for the first guest.
		
	Scenario: List all examinations if the guest is not specified
		
		When I visit the examinations page without guest parameter
		Then I should see all the examinations for all guests
	
	Scenario: Search for an examination
	
		When I visit the examinations page without guest parameter
		And I enter the dates for the the first examination in the date filters
		And I click on the search button
		Then I should see the first examination listed
		
	Scenario: Search for examinations in a range
	
		When I visit the examinations page without guest parameter
		And I enter the dates for both examinations in the date filters
		And I click on the search button
		Then I should see both examinations listed
		
	Scenario: Examination page can be visited
		
		When I visit that examinations page
		Then I should see the examination details.
	
	Scenario: Edit examination
	
		When I visit that examinations edit page
		And change its values
		And press the edit button
		Then the changes should be saved
		And I should see the changed examination
		
	Scenario: Visit the new examination page with a guest parameter	
	
		Given I visit the new examination page with a guest parameter
		Then I should not see the select guest link
		
	Scenario: Delete examination
	
		When I visit that examinations page
		And I click on the delete examination link
		Then the examination should be deleted.
		And I should see the guests page
		
	Scenario: Visiting other users examinations is disabled
		
		When I visit the other examinations page
		Then I should see the main page
		And I should see the error message You can not access this page!
		
	Scenario: Deleting other users examinations is disabled
		
		When I visit the other examinations delete link
		Then I should see the main page
		And I should see the error message You can not access this page!
		
	Scenario: Editing other users examinations is disabled
		
		When I visit the other examinations edit link
		Then I should see the main page
		And I should see the error message You can not access this page!
		
	Scenario: Listing other users examinations is disabled
		
		When I visit the examinations page
		Then I should see only my user's examinations
		
	Scenario: New examination creation is disabled if there is no guest with the given id
	
		When I visit the new examination page with non-existing guest id
		Then I should see the main page
		And I should see the error message There is no guest with this id!
		
	Scenario: Guest selection via search
	
		When I visit the new examination page without guest parameter
		And I click on the select guest button
		And search for a guest on the opened guests page and select the found guest
		Then I should see the new examination page with the selected guests ID.
		
	Scenario: A message tells the user to select guest if its not selected on new examination page
		
		When I visit the new examination page without guest parameter
		Then I should see the error message Please select a guest first!
		
	Scenario: Submiting the new exam form with only the guest selected should keep the guest
	
		Given I visit the new examination page with a guest parameter
		When press the add examination button
		Then I should see the new examination page with the selected guests ID.
		
	Scenario: Remaining error message bug
	
		When I visit the new examination page without guest parameter
		And I click on the select guest button
		Then there should not be a Select guest first message.
		
	Scenario: There should be an add examination link in the main menu
	
		When I visit the application
		And I click the add examination link
		Then I should see the new examination page without a guest parameter
		
		
	