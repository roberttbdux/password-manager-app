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

  Scenario: Options button on saved password
    Given I am a registered user
    When I visit the main page
    And I press the three dots on an entry
    Then I should see a pop up with settings to modify my entry
    And I click on "Show Pass"
    It shows my entry password
    And I click on "Change Pass"
    I can change my entry
    And I click on "Recover Pass"
    I can recover my password
