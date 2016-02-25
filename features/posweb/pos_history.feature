Feature:          Point of Sale Histroy
                  As a Restaurant Agent
                  I Want to view the past orders on POS
                  In Order to keep track of order details

Background:
                  Given I am on login page
                  When  I am logged in to POS as "restaurant agent"
                  Then  I should see "home"

@posweb
Scenario:         Verify history summary is displayed
                  When  I click on "history"
                  Then  I should see history page of "10" days
                  
@posweb
Scenario:         Verify daily history orders is displayed
                  When  I click on "history"
                  And   I click on history summary of a day
                  Then  I should see all past orders for the day
           
