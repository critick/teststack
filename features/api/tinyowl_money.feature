@level0 @tomoneyapi @prod_level0
Feature: ToMoney api to find available Tinyowl money balance
  As a consumer app
  I want to know balance of tiny owl money for a given user

  Scenario Outline: consumer app requests tinyowl money balance api
    Given platform of consumer app is <platform> while getting tinyowl money balance
    When consumer app requests for tinyowl money balance of a user
    Then the response status code should be "200" for tinyowl money balance api
    And available tinyowl money and total tinyowl money should be returned

    Examples: different platform
    |platform|
    |"ANDROID"|
    |"IOS"|
