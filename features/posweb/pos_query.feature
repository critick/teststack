Feature:          Point of Sale Queries
                  As a Restaurant Agent
                  I Want to raise the query from POS
                  In Order to send a message to Tinyowl

Background:

                  When  I am logged in to POS as "restaurant agent"
                  Then  I should see "home"
                                                      
@posweb
Scenario Outline: Verify raise query page is displayed successfully

                  When  I click on "query"
                  Then  I should see query page with <query> and <count> queries

Examples:
                 | query             | count |
                 | "App not working" | "9"   |
                  

@posweb
Scenario Outline:
                  Given I am on query page
                  When  I select a <query_type>
                  And   Fill query text with <text>
                  And   Submit the query
                  Then  I Should see <status>

Examples:        query with and without text should be sent successfully

                 | query_type        | text                    | status       |
                 | "App not working" | "Test App is crashed"   | "sucess"     |
                 | "Holiday"         | ""                      | "sucess"     |
