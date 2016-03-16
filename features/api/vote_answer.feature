Feature:           Forum Vote Answer
                   As a upgrad user
                   I want to vote answers on upgrad forums

@forumapi @voteanswer @smoke
Scenario Outline:  perform upvote on a answer
                   When  <type> user request for <operation> voteanswer
                   Then  voteanswer responds with <statusCode>

Examples:          validate on types of request data
                   | type          | operation | statusCode  |
                   | "existing"    | "add"     | "201"       |
                   | "existing"    | "delete"  | "204"       |
