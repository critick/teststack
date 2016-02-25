Feature: Restaurant related all functionalities

Background:
    Given the correct number and password
    And I try to login
    And I should be able to login
    And Navigating to all restaurants page
    And Search box should be displayed

  @restaurant
  Scenario: Search for the restaurant name
    Given User navigates & enters the details
    And Restaurant creation is successful
    When Enter the restaurant form id
    Then Restaurant name should be displayed
    And User deletes the restaurant

  @restaurant
  Scenario: Deleting a particular restaurant
    Given User navigates & enters the details
    And Restaurant creation is successful
    When Enter the restaurant form id
    And Restaurant name should be displayed
    And User deletes the restaurant
    Then Searching for Restaurant should not display the restaurant