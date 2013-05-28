Feature: The guest can have statistical data linked to him.

	Background: 
	
		Given I have the background

	Scenario: Adding statistical data to a guest
		
		When I visit the guests page
		And I click on the statistics link
		And fill in the statistical data and submit it
		Then I should see the guests page
		And a statistics data should be stored.
		
	Scenario: Existing statistical data can be added
	
		Given I have a guest with statistical data
		When I visit the guests page
		And I click on the statistics link
		And change the statistical data and submit it
		Then I should see the guests page
		And a statistics data should be changed.
		
	Scenario: Save guest can be followed by statistics
	
		When I visit the add guest page
		And fill in the form
		And I click on the add statistic button
		Then the guest should be saved
		And the new statistic page should be shown