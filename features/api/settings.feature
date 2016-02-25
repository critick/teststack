@level0 @setting @prod_level0
Feature: Setting API
	In order to get the settings, consumer app calls the Settings api

Scenario Outline: 	consumer app requests Settings api
	Given platform of consumer app is <platform> while requesting settings api
	When consumer app requests settings api
	Then the response status code should be "200" for settings api
	And <supported_payment_types> as payment types should be returned

Examples: platforms and supported payment types
|platform|supported_payment_types|
|"ANDROID"|"CARD,COD,NET_BANKING,TINYOWL_WALLET,WALLET"|
|"IOS"|"CARD,COD,NET_BANKING,TINYOWL_WALLET,WALLET"|
