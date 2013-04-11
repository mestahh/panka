Feature: users can be CRUD

	Scenario: Register a user
		
		Given I visit the register page
		And enter valid new user data
		When I press the register button
		Then the new user should be created
		
	Scenario: Registration with the same name is not allowed
	
		Given I have a user
		And I visit the register page
		And enter new user data with an existing username
		When I press the register button
		Then I should see the register page
		And no new user should be created
		
	Scenario: Registration fails if the two passwords are not the same
	
		Given I visit the register page
		And enter new user data with not matching passwords
		When I press the register button
		Then I should see the register page
		And no user should be created
		
	Scenario: Registration link visible if not logged in
	
		Given I visit the login page
		When I click on the registration link
		Then I should see the register page
		
	Scenario: Registration page is not available when logged in
	
		Given I have a user
		And I am logged in
		When I visit the register page
		Then I should see an error page
		