Feature: Main Page

  Scenario: Click on Create button
    Given I am a registered user
    When I visit the main page
    And I press "+ Create"
    Then I should see a pop up with empty credentials
    And I fill in "Email" with "user@exampleothersite.com"
    And I fill in "Password" with "password1234"
    And I press "Insert"
    I should see my credetials on the side of the page

    Scenario: Click on Update button
    Given I have an existing entry from Create function
    And I press three buttons next to an entry
    Then I should see a pop up
    And I click "Show Pass" and it shows the pasword
    And I click "Recover Pass" and it recovers the password
    And I click "Change Pass" and I see a popup 
    Then I type in my new password with "password12345"