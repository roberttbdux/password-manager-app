Feature: Categorize Password Strength
  As a user
  I want to see my passwords categorized by strength
  So that I understand which ones are strong and which need improvement

  Scenario: User views password strength breakdown
    Given I am logged in
    And I have a mix of weak, medium, and strong passwords
    When I visit the Watch Tower page
    Then I should see "Overall Password Strength"
    And I should see "Weak Passwords"
    And I should see "Reused Passwords"
