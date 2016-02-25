@level0 @tabsapi @prod_level0
Feature: tabs api to resturns available environments
  As a consumer app
  I want list of tabs available for provided localityid

  Scenario Outline: consumer app requests tabs api
    Given platform of consumer app is <platform>
    When consumer app requests tabs api for locality <localityid>
    Then the response status code should be "200"
    And <tabs_type> should be available

    Examples: locality ids and expected tabs
    |platform|localityid|tabs_type|
    |"ANDROID"|12592|"RESTAURANTS,DISHES,HOMEMADE"|
    |"ANDROID"|11422|"RESTAURANTS,DISHES"|
    |"IOS"|12592|"RESTAURANTS,DISHES"|
    |"IOS"|11422|"RESTAURANTS,DISHES"|
