Feature: User should be on Restaurant Menu and should be able to create menu

  Background:
    Given the correct number and password
    And I try to login
    And I should be able to login
    And Navigating to all restaurants page
    And Search box should be displayed

  Scenario: Create a Menu with category- sub category- and item
    Given User creates restaurant using API
    And User is on Restaurant Menu page
    When Entered menu details
    Then Menu should be able to be pushed successfully
    And When user has the unique restaurant id
    And User requests & receives response for delete restaurant API