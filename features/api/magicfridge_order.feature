@magicfridge

Feature:           MagicFridge Order
                   As a TinyOwlApp user after onboarding with magicfridge
                   I want to get personalised view of tinyowl

Scenario Outline: place order from multiple restaurants
                  Given User checkout order <food> from <multiple> restaurants
                  When  Invoices are generated with "order" and  <multiple> keys
                  | keys           |
                  | order_draft_id |
                  | invoice        |
                  And   Places Order with generated invoice and <payment_method>
                  Then  Order placed with <status> and keys
                  | keys            |
                  | status          |
                  | payment         |
                  | order           |

Examples:         validate on different restaurants, food , platform and payment methods
                  | food   | multiple | payment_method | status |
                  | "item" | "2"      | "COD"          | "200"  |
