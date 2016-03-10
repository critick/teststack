Feature:           Forum Bookmark Question
                   As a upgrad user
                   I want to bookmark questions on upgrad forums

@forumapi
Scenario Outline:  perform bookmark on a question
                   When  <type> user request for bookmark
                   Then  bookmark responds with <statusCode>

Examples:          validate on types of request data
                   | type          | statusCode  |
                   | "existing"    | "201"       |
