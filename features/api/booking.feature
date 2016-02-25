@level0 @booking
Feature: Booking Api
  As a consumer app
  I want to book item for homemade order

Scenario Outline: book item for homemade restaurant
    Given consumer app with <platform> wants to book an item
    When  consumer app books item
    Then  the response status code should be "200" for booking api
    And   booking id should be returned

Examples: platforms
    | platform   |
    | "ANDROID"  |
    | "IOS"      |
