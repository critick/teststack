@level0 @orderapi
Feature: order api to place order
  As a consumer app
  I want to place order from restaurant

Scenario Outline: place order from Restaurant
    Given platform of consumer app is <platform> while placing order
    When consumer app place order from restaurant
    Then the response status code should be "200" for order api
    And order details should be returned with <status>

Examples: platforms
    |platform  | status  |
    |"ANDROID" | "ADDED" |
    |"IOS"     | "ADDED" |

Scenario Outline: place order from Restaurant having multichoice options
    Given platform of consumer app is <platform> while placing order
    When consumer app place order from restaurant having multichoice options
    Then the response status code should be "200" for order api
    And order details should be returned with <status>

Examples: platforms
|platform  | status  |
|"ANDROID" | "ADDED" |
|"IOS"     | "ADDED" |
