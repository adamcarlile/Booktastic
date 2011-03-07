@public
Feature: Bookmarks
  As a user
  I want to be able to view and create Bookmarks, grouped by domain

		Scenario: Viewing a domain from the Homepage
			When I am on the homepage
			And I follow "bbc.co.uk" within "ul#domains li h1"
			Then I should see "BBC News - Egypt protesters attacked by 'armed civilians' in Cairo"
			And I should see "BBC News - France: Jacques Chirac corruption trial to open"
			
		Scenario: Viewing the new Bookmark page
			When I am on the homepage
			And I follow "New Bookmark"
			Then I should see "Url"
			And I should see "Tag list"
			
		Scenario: Creating a new Bookmark
			When I am on the new bookmark page
			And I fill in the following:
			 | Url 			| http://www.cnn.com/2011/WORLD/africa/03/06/libya.conflict/index.html?hpt=T1 |
			 | Tag list | News, Africa, Libya 																												|
			Then I press "Create Bookmark"
			And I should see "cnn.com"
			

			
			
