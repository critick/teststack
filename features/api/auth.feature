Feature:           User actions
                   As a user
                   I want to signup to upgrad

@forumapi
Scenario Outline:  signup new user
                   When  <type>user request for signup
                   Then  user is created with <success> and <status>

Examples:          validate on different platforms
                   | type    | success     | status |
                   | "new"   | "true"      | "200"  |
