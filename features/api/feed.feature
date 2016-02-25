@level0 @feed
Feature: Make sure Feed api is returning active restaurants
  As a User
  I want list of restaurants/dishes available for provided place id

  Scenario Outline: consumer app needs show restaurants for place
    Given User has phone with platform <platform> and app version <version>
    When User enters place with <place_id> for restaurants
    Then response from feed should be "200"
    And feed should return <locality_id> and <restaurant>
    Examples: place ids and expected restaurant
    |platform|version|place_id|locality_id|restaurant|
    |"ANDROID"|"3.6.8"|"ChIJVUuevNHH5zsRRWCWxQX8Ydc"|"11894"|"K.3 SNACKS & SWEETS"|
    |"IOS"|"1.8.1"|"ChIJVUuevNHH5zsRRWCWxQX8Ydc"|"11894"|"K.3 SNACKS & SWEETS"|



  Scenario Outline: consumer app needs show dishes for place
    Given User has phone with platform <platform> and app version <version>
    When User enters place with <place_id> for dishes
    Then response from feed should be "200"
    And feed should return <locality_id> and <dish>
    Examples: place_id and expected dish
    |platform|version|place_id|locality_id|dish|
    |"ANDROID"|"3.6.8"|"ChIJV7RHHAnI5zsRjIVZruUN--g"|11824|"Badam Pista Cream Milkshake"|
    |"IOS"|"1.8.1"|"ChIJV7RHHAnI5zsRjIVZruUN--g"|11824|"Badam Pista Cream Milkshake"|
