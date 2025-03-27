Feature: User Login

  Scenario: Successful login with valid credentials
    Given I am a registered user
    When I visit the login page
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password123"
    And I press "Log in"
    Then I should see a welcome message
    And I should be redirected to my dashboard

  Scenario: Unsuccessful login with incorrect credentials
    Given I am a registered user
    When I visit the login page
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "wrongpassword"
    And I press "Log in"
    Then I should see an error message "Invalid Email or password"

  Scenario: Login with no domain
    Given I visit the login page
    When I visit the login page
    And I fill in "Email" with "user"
    And I press "Log in"
    Then I should see a message saying "please include an @"