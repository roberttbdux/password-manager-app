Feature: Identify Weak Passwords
  As a security-conscious user
  I want to be notified of weak passwords in my vault
  So that I can improve them and protect my accounts

  Scenario: User sees a list of weak passwords
    Given I am logged in
    And I have passwords stored in the vault
    When I visit the Watch Tower page
    Then I should see "Weak Passwords"
    And I should see "Show Items"
