Feature: There should be an admin on the page

	Scenario: Admin login
	
		Given I have an admin
		When I log in with the admin
		Then I should see an admin link
		
	Scenario: Non-admin login
	
		Given I have a regular user
		When I log in with the regular user
		Then I should not see an admin link
		
	Scenario: The admin sees all the examinations
	
		Given I am logged in as an admin
		And there is another user with guests
		When I click on the guests link
		Then I should see the other users guests
		