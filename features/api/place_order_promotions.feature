Feature:            Place order with promotions banner

@level0 @3pl
Scenario:  Validate Order is Placed successfully when clicked on Promotions Banner
                   Given A Restaurant with 3PL capability
                   When Customer places the Order with Promotion
                   Then CS User verify the order status to be "ADDED" and Offer is Applied
