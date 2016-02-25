@level0 @dishorderapi
Feature: order api to place order
  As a consumer app
  I want to place dish order

Scenario Outline: place dish order
    Given platform of consumer app is <platform> while placing dish order
    When consumer app place dish order
    Then the response status code should be "200" for dish order
    And dish order details should be returned

Examples: platforms
    |platform|
    |"ANDROID"|
    |"IOS"|
