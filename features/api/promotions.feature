@level0 @promotionapi
Feature: Promotions API
	In order to get the Promotions available in the locality, User calls the Promotions api

@prod_level0
Scenario: 	Check Promotions Api is fetching the Available Promotions for a locality
			When User makes a Request to Promotions API with Place Id for Hiranandani
			Then Response should contain all the Promotion Ids


Scenario: 	Check Promotions Api is Not fetching the Promotions for a locality
			When User makes a Request to Promotions API with Place Id for Magarpatta City
			Then Response should be "No promotions in your area"

Scenario Outline: 	Check Promotions Api is fetching the Available Promotions for a locality
			When User makes a Request to Promotions API with Place Id for Hiranandani
			And User gets the Promotion Names Array
			Then Response should contain the <promotion_name> and <promotion_type>
Examples: Validate against the promotions
					|promotion_name							|promotion_type	|
					|Level0_Test_Referral_Banner|REFERRAL				|
					|Level0_Test_Web_View				|WEBVIEW				|
					|Level0_Test_Open_Store			|OPEN_STORE			|
					|Level0_Test_Multiple_Resto	|MULTIPLE_RESTAURANT|
					|Level0_Test_Single_Resto		|SINGLE_RESTAURANT|
					|Level0_Test_Display_Resto	|DISPLAY_RESTAURANT|
