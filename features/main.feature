Feature: Password Vault Management
  As a signed-in user
  I want to view and manage my saved credentials
  So that I can securely store my login information

  Background:
    Given I am a registered user
    And I am signed in

  Scenario: View credentials
    When I visit the vault page
    Then I should see "Saved Passwords"

  Scenario: Add a new credential
    When I click "Create +"
    And I fill in "Service" with "example.com"
    And I fill in "Email" with "testuser@example.com"
    And I fill in "Password" with "supersecret"
    And I click "Create"
    Then I should see "example.com" listed

  Scenario: Edit a credential
    Given I have a credential saved for "example.com"
    And I refresh the page
    When I open the actions menu for "example.com"
    And I click "Edit"
    And I change "Email" to "updateduser@example.com"
    And I click "Update"
    Then I should see "updateduser@example.com" next to "example.com"

  Scenario: Delete a credential
    Given I have a credential saved for "example.com"
    And I refresh the page
    When I open the actions menu for "example.com"
    And I click "Delete"
    Then I should not see "example.com" on the page
