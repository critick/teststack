Feature:          API - voting
                  As a user
                  I  want to use vote app
                  In order to place my vote

@api
Scenario Outline: vote as a single user

                  When  I vote for <choice>
                  Then  app should respond with <status>

Examples:        voted for different option to get success response

                 | choice     | status  |
                 | "bug"      | "200"   |
                 | "feature"  | "200"   |
