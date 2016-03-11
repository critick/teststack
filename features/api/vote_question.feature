Feature:           Forum Vote Question
                   As a upgrad user
                   I want to vote questions on upgrad forums

@forumapi @vote
Scenario Outline:  perform vote on a question
                   When  <type> user request for <operation> votequestion
                   Then  votequestion responds with <statusCode>

Examples:          validate on types of request data
                    | type          | operation | statusCode  |
                    | "existing"    | "add"     | "201"       |
                    | "existing"    | "delete"  | "204"       |
