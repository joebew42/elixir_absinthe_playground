# ElixirAbsinthePlayground


## run the application

```
mix deps.get
iex -S mix
```

## make queries

1) access to the GraphiQL web interface at `http://localhost:4000/graphiql`

2) make cURL requests from the command line:

```
curl --data-binary "{\"query\":\"{posts{title body}}\",\"variables\":null,\"operationName\":null}" -H "content-type: application/json" http://localhost:4000/api
```

The accepted payload should be:

```
{
  posts {
    title
    body
  }
}
```

## run tests

```
mix deps.get
mix test
```

## Useful resources on GraphQL/Elixir

- [GraphQL official website](http://www.graphql.org)
- [GraphQL how-to tutorials](https://www.howtographql.com/)
- [Absinthe graphql: testing and displaying changeset errors](https://elixirforum.com/t/absinthe-graphql-testing-and-displaying-changeset-errors/3375)
- [Testing Absinthe with ExUnit](https://tosbourn.com/testing-absinthe-exunit/)

## Scratchpad

**DONE**

- write a simple "hello world" GraphQL endpoint.
- write a test for `posts` endpoint
- remove the `hello` endpoint
- document the how to run tests in the `Readme.md`
- disable DEBUG output messages for Absinthe
- retrieve only one `post`
- handle the not_found error on `post` query
- add in the `interesting resources` paragraph links to graphql.org and howtographql.org
- try to create a relationship between `post` and `author`

**DOING**

**TODO**

- create a new `post`
- let's try to refactor the `graphql_body_for` function to use pattern matching instead of case statement
- update an existing `post`
- delete an existing `post`
- try to put a GraphQL API to the [`elixir_bank_account`](https://github.com/joebew42/elixir_bank_account)
