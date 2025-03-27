Feature: Main Page

  Scenario: Click on Create button
    Given I am a registered user
    When I visit the main page
    And I press "Log in"
    Then I should see a pop up with empty credentials
    And I fill in "Email" with "user@exampleothersite.com"
    And I fill in "Password" with "password1234"
    And I press "Insert"
    I should see my credetials on the side of the page