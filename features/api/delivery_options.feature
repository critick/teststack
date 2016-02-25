Feature:          Delivery Options API
	                In order to get the delivery options to the user
				          User selects the address while placing the order

@level0 @delivery_options
Scenario:	 Validate User is able to place the order selecting Regular Delivery
                  Given A Restaurant with 3PL capability Delivery options enabled and Updated Delivery Area
                  When Customer choose "regular" Delivery and places the Order


@level0 @delivery_options
Scenario:	 Validate User is able to place the order selecting Express Delivery
                  Given A Restaurant with 3PL capability Delivery options enabled and Updated Delivery Area
                  When Customer choose "express" Delivery and places the Order

@level0 @delivery_options
Scenario:	 Validate User is able to place the order outside the Restaurant Delivery Area
                Given A Restaurant with 3PL capability Delivery options enabled and Updated Delivery Area
                When Customer choose "extended delivery" Delivery and places the Order
