Feature:            Place 3PL order to Opinio
                    Customer create the order, CS User place the order and Order gets placed to 3PL enabled restaurant
                    For testing the restaurant BLR-ELCT-0065 has been mapped to Opinio

@level0 @3pl
Scenario:  Validate Order to 3PL enabled restaurant is Placed successfully with backend taxation and without Delivery Option
                   Given A Restaurant with 3PL capability
                   When Customer places the Order
                   And CS User Place the order from panel
                   Then CS User verify the order status to be "CONFIRMED"


@level0 @3pl
Scenario:  Validate Order to 3PL enabled restaurant is Placed successfully with NO Backend Taxation
                   Given A Restaurant with 3PL capability
                   When Customer places the Order with Older App
                   And CS User Place the order from panel
                   Then CS User verify the order status to be "CONFIRMED"

@level0 @3pl
Scenario:  Validate Order is Placed successfully with Valid Promo code
                   Given A Restaurant with 3PL capability
                   When Customer places the Order with Offer
                   And CS User Place the order from panel
                   Then CS User verify the order status to be "CONFIRMED"
