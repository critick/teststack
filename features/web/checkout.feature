Feature:           Checkout Order Page
                   As a Consumer
                   I Want to checkout from dishes page
                   In Order to confirm order details and place order
                  
Background:        user able to type location and select location
                   When user types location
                   And  selects first location from autocomplete
                   And  users buy a dish
                 

Scenario Outline:  Verify Order details
                   When checkout page displayed
                   Then All <entity> details are dislayed
                   
Examples:          list of entities to check
                   | entity         |
                   | "dish"         |
                   | "amounts"      |
                   | "taxes"        |
                   | "image"        |
                   | "forms"        |
                   | "back to menu" |
                 
Scenario:          Fill up user details
                   Given checkout page displayed
                   When  user fills up login details
                   And   user fills up address
                   And   user submits order
                   Then  ongoing orders page is displayed
        
