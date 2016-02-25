Feature: User should be on Restaurant Profile & enter mandatory fields

Background:
    Given the correct number and password
    And I try to login
    And I should be able to login
    And Navigating to all restaurants page
    And Search box should be displayed

  @restaurant
  Scenario: Able to go to restaurant profile
    Given User navigates & enters the details
    And Restaurant creation is successful
    When Enter the restaurant form id
    And user clicks on Edit button
    Then Restaurant Profile should be visible

  @restaurant @api
  Scenario: User should be able fill profile related fields
    Given User creates restaurant using API
    When User is on profile page
    And Enter the restaurant profile fields
    Then User is able to save changes
    And When user has the unique restaurant id
    And User requests & receives response for delete restaurant API