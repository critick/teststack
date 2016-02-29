Feature:         Location Based Dishes Feed
                 As a Consumer
                 I Want to type a location
                 In Order to view dishes for the location
                  
Background:
                 Given User lands on the main homepage
@webproduct
Scenario:        user able to type location and select location
                 When user types location
                 And selects first location from autocomplete
                 Then dishes will be shown
@webproduct
Scenario:        Big Locality Case Input
                 When user types big locality
                 And types small locality
                 Then dishes will be shown

Scenario Outline: User logins to webapp
                  When user logins to webapp
                  Then users <profile> details are displayed

Examples:         validate profile information
                  | profile    |
                  | "username" |
                  | "address"  |

Scenario Outline: Validate homepage
                  When user types big locality
                  And types small locality
                  Then <links> details are displayed

Examples:         validate below elements
                  | links      |
                  | "login"    |
                  | "search"   |
                  | "dish"     |
                  | "images"   |
                  | "items"    |
                  

                  
                 

                     
