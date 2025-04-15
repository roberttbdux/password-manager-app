Feature: User Login
  As a registered user
  I want to log into my account
  So that I can access my saved credentials

  Background:
    Given I am a registered user

  Scenario: Successful login
    When I visit the login page
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password123"
    And I click "Log in"
    Then I should see "Saved Passwords"

  Scenario: Invalid password
    When I visit the login page
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "wrongpassword"
    And I click "Log in"
    Then I should see "Login"

  Scenario: Unknown email
    When I visit the login page
    And I fill in "Email" with "unknown@example.com"
    And I fill in "Password" with "password123"
    And I click "Log in"
    Then I should see "Login"
