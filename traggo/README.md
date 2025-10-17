# README

[Traggo](https://traggo.net/) is a tag-based time tracking tool. In Traggo there are no tasks, only tagged time spans.

With tags, Traggo tries to be as customizable as possible, f.ex. if you work on different projects you could add a project-tag. If you like to see statistics from the different things you do, you could add a type-tag with values like email, programming, meeting. You can do it just as you like.

## Setup

Create `/opt/traggo/data`.

```console
sudo mkdir /opt/traggo/data
```

Just run:

```console
docker compose up -d
```

Visit http://ip_addr:3030 and log in using admin/password.

## GraphQL

GraphQL is a query language for APIs and a runtime for executing those queries. It was developed by Facebook in 2012 and open-sourced in 2015.

With traditional REST APIs, you often face:

* Over-fetching: Getting more data than you need.
* Under-fetching: Making multiple requests to get all the data you need.
* Rigid endpoints: Backend changes require new endpoints.

GraphQL lets clients request exactly what they need in a single request.

Instead of multiple endpoints (`/users`, `/posts`, `/comments`), you have one endpoint where clients send queries describing the data they want.

```graphql
{
  user(id: "123") {
    name
    email
    posts {
      title
      comments {
        text
        author
      }
    }
  }
}
```

The schema defines your data types and relationships:

```graphql
type User {
  id: ID!
  name: String!
  email: String!
  posts: [Post!]!
}

type Post {
  id: ID!
  title: String!
  content: String!
  author: User!
}
```

* Queries read data (like GET).
* Mutations modify data (like POST/PUT/DELETE).
* Subscriptions are real-time updates via WebSocket.

## GraphiQL

GraphiQL (pronounced "graphical") is an in-browser IDE for exploring and testing GraphQL APIs. It's one of the most useful tools when working with GraphQL.

GraphiQL provides:

* Interactive query editor with syntax highlighting.
* Auto-completion as you type queries.
* Documentation explorer to browse your entire schema.
* Query history to see previous queries.
* Real-time results for running queries and to see responses immediately.
* Prettify/format queries automatically.

Visit http://ip_addr:3030/graphql to access GraphiQL.

The documentation explorer is particularly valuable since it automatically generates docs from your schema. Click "Docs" in the top right and you can browse all available types, queries, and mutations without reading separate documentation.

The auto-completion (triggered with Ctrl+Space) shows you what fields are available as you type, making it easy to discover your API.

Minimal query; you will need to log in first.

```
query Minimal {
  currentUser {
    id
    name
  }

  tags {
    key
  }
}
```
