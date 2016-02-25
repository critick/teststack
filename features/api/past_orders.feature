@level0 @past_orders
Feature: verify past order apis
  As a consumer app
  I want to get past orders


  Scenario Outline: verify scheduled orders api
    Given platform of consumer app is <platform> while getting scheduled orders
    When consumer app requests for scheduled orders of a user
    Then the response status code should be "200" for scheduled orders api
    And scheduled orders should be returned

    Examples: different platform
    |platform|
    |"ANDROID"|
    |"IOS"|


Scenario Outline: verify get order status api
    Given platform of consumer app is <platform> while placing order
    When consumer app place order from restaurant
    And <platform> consumer app requests for order status of a user
    Then the response status code should be "200" for order status api
    And order status of ongoing order should be returned

    Examples: different platform
    |platform|
    |"ANDROID"|
    |"IOS"|


Scenario Outline: verify get past orders api
    Given platform of consumer app is <platform> while getting past orders
    When consumer app requests for past orders of a user
    Then the response status code should be "200" for past orders api
    And past orders should be returned

    Examples: different platform
    |platform|
    |"ANDROID"|
    |"IOS"|
