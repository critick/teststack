Feature:           Forum Vote
                   As a upgrad user
                   I want to vote answers on upgrad forums

@forumapi @vote
Scenario Outline:  perform upvote on a answer
                   When  <type> user request for voteanswer
                   Then  voteanswer responds with <statusCode>

Examples:          validate on types of request data
                   | type          | statusCode  |
                   | "existing"    | "200"       |
