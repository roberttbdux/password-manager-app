Feature: Main Page

  Scenario: Click on Create button
    Given I am a registered user
    When I visit the main page
    And I press "+ Create"
    Then I should see a pop up with empty credentials
    And I fill in "Service" with "ExampleOtherSite"
    And I fill in "Email" with "user@exampleothersite.com"
    And I fill in "Password" with "password1234"
    And I press "Insert"
    I should see my credetials on the side of the page

    Scenario: Show Pass 
    Given I have an existing entry from Create function
    And I press three buttons next to an entry
    Then I should see a pop up
    And I click "Show Pass" 
    Then it shows the pasword

    Scenario: Recover Pass 
    When I press three buttons next to an entry
    Then I click "Recover Pass" and it recovers the password
    Then I should see a menu with options to recover password

    Scenario: Change Pass
    When I press three buttons next to an entry
    Then I click "Change Pass" and I see a popup 
    Then I type in my new password with "password12345"

    Scenario: Search for Service
    Given I have a service
    And I access the service bar and enter "ExampleOtherSite"
    Then I should see "ExampleOtherSite"