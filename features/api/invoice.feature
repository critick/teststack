Feature:          Invoice Generation API
	                In order to get the detailed Invoice of Order
				          User calls the Invoice api

@level0 @invoice_homemade @resto
Scenario Outline:	 Validate Invoice Api for Restaurant
		        	     Given A Restaurant with <pkg_charge>,<service_tax>,<service_charge> and <is_3pl>
			             When User makes a Request to Invoice API to a Resturant
			             Then Response contains <cart_amount>,<delivery_charge>,<service_tax>,<pkg_charge>,<service_charge> and <payable_amount>

Examples:          changing charges,taxes and 3pl flag
                   | pkg_charge| service_tax | service_charge | is_3pl    | cart_amount | delivery_charge | payable_amount |
                   | 10        | 5           | 20             | "false"   | 400         | 10              | 442            |
                   | 0         | 0           | 0              | "false"   | 400         | 10              | 410            |
                   | 10        | 5           | 20             | "true"    | 400         | 40              | 477            |

@invoice_homemade
Scenario Outline:  Invoice for homemade restaurant
    Given consumer app with <platform> wants to call invoice api
    When  consumer app calls invoice
    Then  the response status code should be "200" for invoice api
    And   order draft id should be returned

Examples: platforms
    | platform   |
    | "ANDROID"  |
    | "IOS"      |
