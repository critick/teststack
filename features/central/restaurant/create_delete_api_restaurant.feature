Feature: User Creates a Restaurant

  Scenario: User should be able to create a restaurant
    Given User is on Restaurant Page
    When User navigates & enters the details
    Then Restaurant creation is successful

  Scenario: User should be able to create restaurant via API call
    When User creates restaurant using API
    Then User is able to create a new restaurant

  Scenario: User is able to delete the restaurant via API Call
    Given When user has the unique restaurant id
    When User requests & receives response for delete restaurant API
    Then User is able to delete a restaurant