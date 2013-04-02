Feature: Guest handling

	Scenario: Adding a guest
		
		Given I am logged in
		When I am adding a new guest to the database
		Then the new guest should be stored
		
	Scenario: View a guest
		
		Given I have a guest
		When I visit the guests page
		Then I should see the details about the guest.
		
	Scenario: Edit a guest
	
		Given I have a guest
		When I visit the guests edit page
		And change the values
		Then the new values should be stored
		
	Scenario: Delete a guest
	
		Given I have a guest
		When I visit the guests edit page
		And click on the delete guest link
		Then the guest should be removed from the database
		And I should see the all guests page
		
	Scenario: Find guest with unique name
	
		Given I have a guest
		When I visit the page for displaying all guests
		And search for his name
		Then I should see the details about the guest.
		
	Scenario: Find a guest if there are more with the same name
	
		Given I have two guests with the same name and another different one
		When I visit the page for displaying all guests
		And search for his name
		Then I should see the all guests page with the matching guests.
		
	Scenario: Search for an empty string does nothing
	
		When I try to search for an empty guestname
		Then I should see the all guests page
		
	Scenario: Search for a non-existing guest displays message
	
		Given I have a guest
		When I visit the page for displaying all guests
		And search for a non-existing name
		Then I should see the all guests page 
		And I should see an error message about the unsuccessful search
	