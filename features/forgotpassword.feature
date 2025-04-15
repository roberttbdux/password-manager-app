Feature: Password Recovery
  As a registered user
  I want to reset my password
  So that I can regain access if I forget my credentials

  Scenario: Request password reset
    When I visit the forgot password page
    And I fill in "Email" with "user@example.com"
    And I click "Send me reset password instructions"
    Then I should see "You will receive an email with instructions on how to reset your password in a few minutes."