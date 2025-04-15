Feature: View Overall Security Score
  As a user
  I want to see a security score based on my passwords' quality
  So that I can track how secure my password management is

  Scenario: User sees a calculated security score
    Given I am logged in
    When I visit the Watch Tower page
    Then I should see "Overall Security Score"
