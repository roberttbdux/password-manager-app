Feature: Forgot Password

  Scenario: Navigate to Forgot Password page
    Given I am on the login page
    When I click on "Forgot your password?"
    Then I should be redirected to the password reset page