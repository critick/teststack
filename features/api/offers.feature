@level0 @offersapi
Feature: offes api to resturns offers details
  As a consumer app
  I want details of offer applied

Scenario Outline: consumer app requests offers api with valid promo code
    Given platform of consumer app is <platform> while requesting offer api
    When consumer app requests offer api with valid <promo_code>
    Then the response status code should be "200" for offer api
    And <offer_id> should be returned

Examples: valid promo code and offer id
    |platform|promo_code|offer_id|
    |"ANDROID"|"TAX100"|"5666c35b123fea02cd000002"|
    |"IOS"|"TAX100"|"5666c35b123fea02cd000002"|

Scenario Outline: consumer app requests offers api with invalid promo code
      Given platform of consumer app is <platform> while requesting offer api
      When consumer app requests offer api with invalid <promo_code>
      Then the response status code should be "400" for offer api
      And <message> and <error> should be returned

Examples: invalid promo code and error
      |platform|promo_code|message|error|
      |"ANDROID"|"TEST123"|"Promo code invalid"|"OFFER_INVALID"|
      |"IOS"|"TEST123"|"Promo code invalid"|"OFFER_INVALID"|
