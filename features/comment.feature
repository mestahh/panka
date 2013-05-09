Feature: It should be available to comment guests and examinations

	Background:
		Given I have the background

	Scenario: Comment examination
	
		When I visit that examinations page
		And I put a comment on that
		Then my comment should be saved and displayed.
		
	Scenario: Delete examination comment
	
		Given I have a comment on an examination
		When I visit that examinations page
		And I delete that comment
		Then the comment should be deleted and non-visible
		
		