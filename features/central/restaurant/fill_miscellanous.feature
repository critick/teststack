Feature: User should be on Restaurant Miscellaneous page and fill fields

   Background:
    Given the correct number and password
    And I try to login
    And I should be able to login
    And Navigating to all restaurants page
    And Search box should be displayed

  @restaurant @api
  Scenario: User should be able to enter mandatory fields
    Given User creates restaurant using API 
    And User is on Miscellaneous page
    When Enter the mandatory fields
    Then User is able to save changes on misc page
    And When user has the unique restaurant id
    And User requests & receives response for delete restaurant API