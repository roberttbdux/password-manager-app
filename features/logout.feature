Feature: Logout
  As a signed-in user
  I want to log out of my account
  So that I can protect my information

  Background:
    Given I am a registered user
    And I am signed in

  Scenario: Successful logout
    When I click "Logout"
    Then I should see "Sign up"