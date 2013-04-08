Feature: Guest handling

	Background: 
	
		Given I have the background
	
	Scenario: Adding a guest
		
		When I am adding a new guest to the database
		Then the new guest should be stored
		
	Scenario: View a guest
		
		When I visit the guests page
		Then I should see the details about the guest.
		
	Scenario: Edit a guest
	
		When I visit the guests edit page
		And change the values
		Then the new values should be stored
		
	Scenario: Delete a guest
	
		When I visit the guests edit page
		And click on the delete guest link
		Then the guest should be removed from the database
		And I should see the all guests page
		
	Scenario: Find guest with unique name
	
		When I visit the page for displaying all guests
		And search for the first guest name
		Then I should see the details about the guest.
		
	Scenario: Find a guest if there are more with the same name
	
		When I visit the page for displaying all guests
		And search for the second guest name
		Then I should see the all guests page with the matching guests.
		
	Scenario: Search for an empty string does nothing
	
		When I try to search for an empty guestname
		Then I should see the all guests page
		
	Scenario: Search for a non-existing guest displays message
	
		When I visit the page for displaying all guests
		And search for a non-existing name
		Then I should see the all guests page 
		And I should see an error message about the unsuccessful search
		
	Scenario: Opening the guest page in select mode
	
		When I visit the guests page in select mode
		And click on a guests name
		Then I should see the new examination page with the guest id
		
	Scenario: A guest belongs to a user
	
		And I visit the page for displaying all guests
		Then I should see only the first users guest 
		
	Scenario: Visiting other users guest is disabled
	
		When I visit the second users guest
		Then I should see an error page
		
	Scenario: Editing other users guest is disabled
	
		When I visit the second users guest edit page
		Then I should see an error page
		
	Scenario: Deleting other users guest is disabled
	
		When I visit the second users guest delete link
		Then I should see an error page
		
	
	