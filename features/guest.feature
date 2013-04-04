Feature: Guest handling

	Scenario: Adding a guest
		
		Given I am logged in
		When I am adding a new guest to the database
		Then the new guest should be stored
		
	Scenario: View a guest
		
		Given I am logged in
		And I have a guest
		When I visit the guests page
		Then I should see the details about the guest.
		
	Scenario: Edit a guest
	
		Given I am logged in
		And I have a guest
		When I visit the guests edit page
		And change the values
		Then the new values should be stored
		
	Scenario: Delete a guest
	
		Given I am logged in 
		And I have a guest
		When I visit the guests edit page
		And click on the delete guest link
		Then the guest should be removed from the database
		And I should see the all guests page
		
	Scenario: Find guest with unique name
	
		Given I am logged in 
		And I have a guest
		When I visit the page for displaying all guests
		And search for his name
		Then I should see the details about the guest.
		
	Scenario: Find a guest if there are more with the same name
	
		Given I am logged in
		And I have two guests with the same name and another different one
		When I visit the page for displaying all guests
		And search for his name
		Then I should see the all guests page with the matching guests.
		
	Scenario: Search for an empty string does nothing
	
		Given I am logged in
		When I try to search for an empty guestname
		Then I should see the all guests page
		
	Scenario: Search for a non-existing guest displays message
	
		Given I am logged in
		And I have a guest
		When I visit the page for displaying all guests
		And search for a non-existing name
		Then I should see the all guests page 
		And I should see an error message about the unsuccessful search
		
	Scenario: Opening the guest page in select mode
	
		Given I am logged in
		And I have a guest
		When I visit the guests page in select mode
		And click on a guests name
		Then I should see the new examination page with the guest id
		
	Scenario: A guest belongs to a user
	
		Given I have two users
		And I have one guest for each user
		When I log in with the first user
		And I visit the page for displaying all guests
		Then I should see only the first users guest 
		
	Scenario: Visiting other users guest is disabled
	
		Given I have two users 
		And I have a guest for both
		And I log in with the first user
		When I visit the other users guest
		Then I should see an error page
		
	Scenario: Editing other users guest is disabled
	
		Given I have two users 
		And I have a guest for both
		And I am logged in
		When I visit the other users guest edit page
		Then I should see an error page
		
	Scenario: Deleting other users guest is disabled
	
		Given I have two users 
		And I have a guest for both
		And I am logged in
		When I visit the other users guest delete link
		Then I should see an error page
		
	Scenario: Search displays only the users guests
	
		Given I have two users
		And I have a guest for both
		And I log in with the first user
		When I visit the page for displaying all guests
		And search for the first guests name
		Then I should see the first users guest and not the second
	