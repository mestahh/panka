Feature: users can be CRUD

	Scenario: Register a user
		
		Given I visit the register page
		And enter valid new user data
		When I press the register button
		Then the new user should be created