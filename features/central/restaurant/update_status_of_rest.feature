Feature: User should be able to change the state of a restaurant

  Background:
    Given the correct number and password
    And I try to login
    And I should be able to login
    And Navigating to all restaurants page
    And Search box should be displayed

  @restaurant
  Scenario: Update Restaurant Status to ACTIVE
    Given User creates restaurant using API
    And User is on Update Status page
    When Changed the state of restaurant to ACTIVE
    Then Restaurant should be changed to ACTIVE
    And When user has the unique restaurant id
    And User requests & receives response for delete restaurant API