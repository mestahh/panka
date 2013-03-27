Feature: Guest handling

	Scenario: Adding a guest
		Given I am logged in
		When I am adding a new guest to the database
		Then the new guest should be stored