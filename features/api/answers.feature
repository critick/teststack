Feature:           Forum Answers
                   As a upgrad user
                   I want to view/add/update/delete answers on upgrad forums

@forumapi @smoke
Scenario Outline:  post answers to a question
                   When  <type> user request for answers
                   Then  answers responds with <statusCode>

Examples:          validate on types of request data
                   | type          | statusCode  |
                   | "existing"    | "201"       |
