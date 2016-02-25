Feature: User should be on Restaurant Timings & enter all timings field

  Background:
    Given the correct number and password
    And I try to login
    And I should be able to login
    And Navigating to all restaurants page
    And Search box should be displayed


  Scenario: Timings row should be inserted
    Given User creates restaurant using API
    When User is on Restaurant Timings page
    And Entered operational, item & delivery timings
    Then I should be able to save successfully
    And When user has the unique restaurant id
    And User requests & receives response for delete restaurant API