# Projects

## Team Conversation

> **Product Manager (PM):** So, we need to prototype a new project that will be essentially allowing our different users to leave a comment, update status (if they can) and then list both comments and status changes.

> **Developer (D):** Cool, no problem. I'm assuming we will have a few different types of users, like end-clients, agents and solicitors and that they should be able to login and see a list of their projects and once they choose one, either leave a comment or update the status on it?

> **PM:** Yeah, and only solicitors should be able to update the status of their projects.

> **D:** That makes sense, we'll do that. I'm assuming we want a nice generic/modern timeline interface with information about who did what when, and that it's responsive so it looks good on mobile?

> **PM:** Of course, goes without saying...

> **D:** Since this is a timeline view, I'm assuming we want to list newest comments/status changes first? It won't really make sense otherwise, if you don't see your comment once you post it.

> **PM:** You got it.

> **D:** And we'll put the current users e-mail/name in the top right corner alongside a logout button?

> **PM:** That makes sense.

> **D:** Cool, I think we can work with this as a first version. Once there is something to show we can have a quick look/demo together.

> **PM:** Okay. You have 3 hours.

## Output

In the demo app there are 3 users with password `password123`. Only the solicitor role can update the project's status.

- solicitor@example.com
- client@example.comm
- agent@example.comm

There is no real technical difference between the agent/client accounts.

## Future Technical Improvements

- Loads of opportunity for additional tests
- Extracting the User role policies into Policy classes, that can be independently tested
- We could deliver live project updates via Turbo/Websockets so users don't have to refresh to see updates.
