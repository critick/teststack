Feature: Uploading the restaurant image file

  Background:
    Given the correct number and password
    And I try to login
    And I should be able to login
    And Navigating to all restaurants page
    And Search box should be displayed


  Scenario: Attempt uploading image file
    Given User creates restaurant using API
    And I am able to see logo field on Logs & Documents page
    And I upload image file
    Then I am able to see uploaded image
    And When user has the unique restaurant id
    And User requests & receives response for delete restaurant API