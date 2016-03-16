Feature:           Forum Comments
                   As a upgrad user
                   I want to use comments on upgrad forums

@forumapi @smoke
Scenario Outline:  get comments of a question
                   When  <type> user request for comments
                   Then  comments responds with <statusCode>

Examples:          validate on types of request data
                   | type          | statusCode  |
                   | "existing"    | "201"       |
