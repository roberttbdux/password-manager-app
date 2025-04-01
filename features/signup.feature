Feature: Sign Up

  Scenario: Navigate to Sign Up page
    Given I am on the login page
    When I click on "Sign up"
    Then I should be redirected to the registration page

  Scenario: Signing Up with the same account
    Given I am on the login page
    When I click on "Sign up"
    Then I should be redirected to the registration page
    When I type in an existing account from my database
    Then I should be returned to the login page without a new account being made