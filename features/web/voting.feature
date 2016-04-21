Feature:          API - voting
                  As a user
                  I  want to use vote app
                  In order to place my vote

@web
Scenario Outline: vote as a single user
                  Given I am on voting page
                  When  I see <title>
                  Then  I vote for <choice>

Examples:        voted for different option to get success response

                 | choice     | title              |
                 | "bug"      | "Bug vs Feature!"   |
                 | "feature"  | "Bug vs Feature!"   |
