@public
Feature: Domains
  As a user
  I want to be able to view the Domains that the bookmarks are organised into

	Scenario Outline: Visiting the Homepage
		When I am on the homepage
		Then I should see "<domain>" within "ul#domains"
		
		Examples:
		 | domain           |
		 | bbc.co.uk        |
		 | apple.com        |
		 | en.wikipedia.org |
		 | 37signals.com    |

		
