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
		Then I should see the main page
		And I should see the error message You are not allowed to register!
		
	Scenario: A user can edit its own data
	
		Given I have a user
		And I am logged in
		When I visit the edit user page
		And change the user data
		Then the changed user data should be saved
		
	Scenario: A user can not edit other users data
		
		Given I have the background
		When I visit the other users edit page
		Then I should be redirected to the main page
		And I should see the error message You are not allowed to view this page
		
	Scenario: There should be a link to the edit user page
	
		Given I have the background
		When I click on the account link
		Then I should see the edit user page
		
	Scenario: Log in with a user with magyar as the selected language
	
		Given I have a user with magyar as the selected language
		And I log in with that user
		Then I should see the main page with hu locale
		
	Scenario: Edit user data and empty email field
	
		Given I have the background
		And I visit the edit user page
		When I change the user data and the email is empty
		Then I should see the edit page and the error message: Email can't be blank
		
	Scenario: Edit user data and empty password field
	
		Given I have the background
		And I visit the edit user page
		When I change the user data and the password is empty
		Then I should see the edit page and the error message: Password can't be blank
		
	Scenario: Edit user data and empty username field
	
		Given I have the background
		And I visit the edit user page
		When I change the user data and the username is empty
		Then I should see the edit page and the error message: Username can't be blank
	
	Scenario: User login time should be stored
	
		Given I have the background
		And my last login was in yesterday
		When I log out and log in again
		Then the last login timestamp should be updated
		
	Scenario: The user requests a forgot password email
	
		Given I visit the forgot password link
		When I enter my email address and submit the form
		Then I should receive an email
		
	Scenario: A user should be able to change his password
	
		Given I visit the edit user page with my authentication link
		Then I should be able to change my password
		