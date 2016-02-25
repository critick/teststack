
@level0 @orderapih @homemade
Feature: order api to place homemade order
  As a consumer app
  I want to place order from homemade

Scenario Outline: place order from Homemade
    Given platform of consumer app is <platform> while placing homemade order
    When consumer app place order from homemade
    Then the response status code should be "200" for homemade order
    And homemade order details should be returned

Examples: platforms
    |platform|
    |"ANDROID"|
    |"IOS"|
