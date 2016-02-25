@level0 @orderapi
Feature: order api to place order with payment method as TO Money
  As a consumer app
  I want to place order from restaurant with payment method as TO Money

Scenario Outline: place order from Restaurant with payment method as TO Money
    Given platform of consumer app is <platform> while placing order with payment method as <payment_method>
    When consumer app place order with payment method as <payment_method> from restaurant
    Then the response status code should be "200" for order api
    And order details should be returned with <status>
    And payment method should be <tinyowl_payment>

Examples: platforms
    | platform  | payment_method    | tinyowl_payment  | status     |
    | "ANDROID" | "TINYOWL_WALLET"  | "TINYOWL_WALLET" | "ADDED"    |
    | "IOS"     | "TINYOWL_WALLET"  | "TINYOWL_WALLET" | "ADDED"    |
    | "ANDROID" | "PAYUMONEY"       | "WALLET"         | "RECEIVED" |
    | "ANDROID" | "OLA"             | "WALLET"         | "RECEIVED" |
    | "ANDROID" | "PAYTM"           | "WALLET"         | "RECEIVED" |
    | "ANDROID" | "MOBIKWIK"        | "WALLET"         | "RECEIVED" |
