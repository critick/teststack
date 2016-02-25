@level0 @fetch_orders
Feature: Fetch orders for pos
  As a pos app
  I want to fetch orders

Scenario Outline:  Fetch different types of orders
  When pos app fetch orders of type <type>
    Then the response status code should be "200" for fetch order api
    And should return orders of type <type>

    Examples: order type
      |type|
      |"NEW"|
      |"PREPARING"|
      |"SCHEDULED"|

Scenario: verify payload received in fetch order api for homemade restaurant
    Given platform of consumer app is "ANDROID" while placing homemade order
    When consumer app place order from homemade
    Then newly placed order from homemade should be returned in pos app fetch order api
    And order payload should contains following list of keys
    | header|
    | user_name |
    | contact_number|
    | address|
    | restaurant|
    | cart_with_dish_info|
    | cart|
    | order_payment|
    | address|
    | restaurant|
    | cart_with_dish_info|
    | cart|
    | order_payment|

Scenario: verify fetch live order
    Given platform of consumer app is "ANDROID" while placing homemade order
    When consumer app place order from homemade
    And pos app fetch live order
    Then live order details should be fetched
    | header|
    | user_name |
    | contact_number|
    | address|
    | restaurant|
    | cart_with_dish_info|
    | cart|
    | order_payment|
    | address|
    | restaurant|
    | cart_with_dish_info|
    | cart|
    | order_payment|

Scenario: verify payload received in fetch order api for non homemade pos restaurant
        Given platform of consumer app is "ANDROID" while placing order
        When consumer app place order from restaurant enabled for pos
        Then newly placed order from restaurant enabled for pos should be returned in pos app fetch order api
        And order payload should contains following list of keys
        | header|
        | user_name |
        | contact_number|
        | address|
        | restaurant|
        | cart_with_dish_info|
        | cart|
        | order_payment|
        | address|
        | restaurant|
        | cart_with_dish_info|
        | cart|
        | order_payment|
