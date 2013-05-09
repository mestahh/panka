Feature: Guest handling

	Background: 
	
		Given I have the background
	
	Scenario: Adding a guest
		
		When I am adding a new guest to the database
		Then the new guest should be stored
		And I should see the message Guest stored.
		
	Scenario: View a guest
		
		When I visit the guests page
		Then I should see the details about the guest.
		
	Scenario: Edit a guest
	
		When I visit the guests edit page
		And change the values
		Then the new values should be stored
		And I should see the message Guest data changed.
		
	Scenario: Delete a guest
	
		When I visit the guests edit page
		And click on the delete guest link
		Then the guest should be removed from the database
		And I should see the all guests page
		And I should see the message Guest deleted.
		
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
		Then I should see no guests on the finder page
		
	Scenario: Search for a non-existing guest displays message
	
		When I visit the page for displaying all guests
		And search for a non-existing name
		Then I should see no guests on the finder page
		And I should see the error message There is no guest with this name.
		
	Scenario: Opening the guest page in select mode
	
		When I visit the guests page in select mode
		And click on a guests name
		Then I should see the new examination page with the guest id
		
	Scenario: A guest belongs to a user
	
		And I visit the page for displaying all guests
		Then I should see only the first users guest 
		
	Scenario: Visiting other users guest is disabled
	
		When I visit the second users guest
		Then I should see the main page
		And I should see the error message You are not allowed to view this page!
		
	Scenario: Editing other users guest is disabled
	
		When I visit the second users guest edit page
		Then I should see the main page
		And I should see the error message You are not allowed to view this page!
		
	Scenario: Deleting other users guest is disabled
	
		When I visit the second users guest delete link
		Then I should see the main page
		And I should see the error message You are not allowed to view this page!
		
	Scenario: Not necessary-error message after two search
	
		When I visit the page for displaying all guests
		And search for a non-existing name
		And search for the first guest name
		Then there should be no error message on the page

	Scenario: Guest can be marked as VIP
		
		When I visit the guests page
		And I mark the guest as a VIP
		Then the guest should be marked as VIP
		
	Scenario: A bad VIP Guest can be marked as non-VIP
		
		Given I have a bad VIP guest
		When I visit the guests page
		And I mark the guest as a non VIP
		Then the guest should be marked as non VIP
	
	