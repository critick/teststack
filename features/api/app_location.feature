Feature:          Select location for user
                  As a Tinyowl App user
                  I want to use location detection and search
                  In Order to set my current location
@prod_level0                  
Scenario Outline: custom autocomplete service
                  When I search for <query> in autocomplete
                  Then I see  prediction for this <place>

Examples:         predictions for each query

                  | query          | place                                               |
                  | "hiranandani"  | "Hiranandani Gardens, Mumbai, Maharashtra, India"   |
