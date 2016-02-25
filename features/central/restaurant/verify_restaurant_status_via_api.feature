Feature: Restaurant should be visible in the api with status 'ACTIVE'

  Scenario: Verify the restaurant by ids API call and status of the restaurant as ACTIVE
    Given User sends a request of the API
    When User receives the response
    Then Restaurant ID and Status field should be correctly