Feature: User should be on delivery areas page & delivery areas for a restaurant

  Background:
    Given the correct number and password
    And I try to login
    And I should be able to login
    And Navigating to all restaurants page
    And Search box should be displayed

  Scenario:
    Given User creates restaurant using API
    And I am on delivery areas page
    When I enter the delivery areas
    Then I should be able to save delivery areas successfully
    And When user has the unique restaurant id
    And User requests & receives response for delete restaurant API