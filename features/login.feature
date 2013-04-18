Feature: Login

	Scenario: Successful login
		
		Given I have a user
		And I visit the login page
		And enter the correct credentials
		When I click the login button
		Then I should see the main page
		
	Scenario: Wrong password
		
		Given I have a user
		And I visit the login page
		And enter the correct username
		And enter the wrong password
		When I click the login button
		Then I should see the login page
		And I should see the error message Login failed.
		
	Scenario: Wrong username
	
		Given I have a user
		And I visit the login page
		And enter a non-existing username
		And enter a password
		When I click the login button
		Then I should see the login page
		And I should see the error message Login failed.
		
	Scenario: The user is stored in a session
		
		Given I have a user
		And I am logged in 
		When I visit the login page
		Then I should see the main page
		
	Scenario: Logout
		
		Given I have a user
		And I am logged in
		When I click on the logout link
		Then I should see the login page
		And I should see the login page
		
	Scenario: The init page should be the login page
	
		Given I visit the page
		Then I should be redirected to the login page
		