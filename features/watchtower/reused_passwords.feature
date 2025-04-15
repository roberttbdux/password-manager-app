Feature: Detect Reused Passwords
  As a user
  I want to know which passwords are used for multiple accounts
  So that I can reduce my risk of credential stuffing

  Scenario: User sees reused passwords
    Given I am logged in
    And I have passwords stored in the vault
    When I visit the Watch Tower page
    Then I should see "Reused Passwords"
    And I should see "Show Items"
