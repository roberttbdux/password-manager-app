Feature: User Signup
  As a new visitor
  I want to create an account
  So that I can securely store my passwords

  Scenario: Successful signup
    Given I am on the signup page
    When I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password123"
    And I fill in "Password confirmation" with "password123"
    And I click "Sign up"
    Then I should see "Saved Passwords"

  Scenario: Password confirmation mismatch
    Given I am on the signup page
    When I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password123"
    And I fill in "Password confirmation" with "wrongpassword"
    And I click "Sign up"
    Then I should see "Password confirmation"
