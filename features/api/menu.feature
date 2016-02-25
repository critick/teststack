@level0 @menu
Feature: Menu from restaurants should work as expected
  As a User
  I want list of menu items for given restaurant

  Scenario Outline: Recommended Menu items are shown
    Given User has phone with platform <platform> and app version <version>
    When User selects <restaurant_id> restaurants
    Then response from recommendation should be "200"
    And recommendation have should have non zero items
    Examples: restaurant and menu item
    |platform|version|restaurant_id|
    |"ANDROID"|"3.6.8"|"5435307c091d49e113002030"|
    |"IOS"|"1.8.1"|"5435307c091d49e113002030"|

  @getflatmenu  
  Scenario Outline: Menu items are shown
    Given User has phone with platform <platform> and app version <version>
    When User selects <restaurant_id> restaurant to view menu
    Then response from get flat menu should be "200"
    And menu items should contain <category> <timing> <choice> <choice_option> <item> <item_size> <item_price>
    Examples: restaurant and menu details
    |platform|version|restaurant_id|category|timing|choice|choice_option|item|item_size|item_price|
    |"ANDROID"|"3.6.8"|"5503036b983a529e7000002d"|"SNACKS"|"T1"|"ADD MORE PAV"|"BUTTER PAV"|"PAV BHAJI"|"HALF"|"120.0"|
    |"IOS"|"1.8.1"|"5503036b983a529e7000002d"|"SNACKS"|"T1"|"ADD MORE PAV"|"BUTTER PAV"|"PAV BHAJI"|"HALF"|"120.0"|
