Feature:           Forum Vote
                   As a upgrad user
                   I want to vote questions on upgrad forums

@forumapi @vote
Scenario Outline:  perform upvote on a question
                   When  <type> user request for votequestion
                   Then  votequestion responds with <statusCode>

Examples:          validate on types of request data
                   | type          | statusCode  |
                   | "existing"    | "200"       |
