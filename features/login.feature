Feature: Login

	Scenario: Successful login
		
		Given I visit the login page
		And enter the correct credentials
		When I click the login button
		Then I should see the main page
		
	Scenario: Wrong password
		
		Given I visit the login page
		And enter the correct username
		And enter the wrong password
		When I click the login button
		Then I should see the login page
		And I should see an error message
		
	Scenario: Wrong username
	
		Given I visit the login page
		And enter a non-existing username
		And enter a password
		When I click the login button
		Then I should see the login page
		And I should see an error message
		
	Scenario: The user is stored in a session
	
		Given I am logged in 
		When I visit the login page
		Then I should see the main page
		
	Scenario: Logout
		
		Given I am logged in
		When I click on the logout link
		Then I should see the login page
		And I should see the login page
		
	Scenario: The init page should be the login page
	
		Given I visit the page
		Then I should see the login page
		