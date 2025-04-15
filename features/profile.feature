Feature: Profile Settings
  As a signed-in user
  I want to update my profile information
  So that I can manage my account settings

  Background:
    Given I am a registered user
    And I am signed in

  Scenario: View profile settings
    When I visit the profile settings page
    Then I should see "Profile Settings"
    And I should see "Name"
    And I should see "Email"
    And I should see "Edit"

  Scenario: Edit and save profile information
    When I visit the profile settings page
    And I click "Edit"
    And I fill in "Name" with "Updated User"
    And I fill in "Email" with "updated@example.com"
    And I fill in "Current password" with "password123"
    And I click "Save"
    Then I should see "Profile updated"
    And I should see "Updated User"
    And I should see "updated@example.com"

  Scenario: Cancel profile editing
    When I visit the profile settings page
    And I click "Edit"
    And I fill in "Name" with "Someone Else"
    And I click "Cancel"
    Then I should not see "Someone Else"
