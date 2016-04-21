Feature:          API - voting
                  As a user
                  I  want to use vote app
                  In order to place my vote

@web
Scenario Outline: vote as a single user

                  When  I vote for <choice>
                  Then  <choice> should have <share>

Examples:        voted for different option to get success response

                 | choice     | share   |
                 | "bug"      | "100"   |
                 | "feature"  | "100"   |
