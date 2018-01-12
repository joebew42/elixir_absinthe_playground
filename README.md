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

## Interesting resources about

- [Absinthe graphql: testing and displaying changeset errors](https://elixirforum.com/t/absinthe-graphql-testing-and-displaying-changeset-errors/3375)
- [Testing Absinthe with ExUnit](https://tosbourn.com/testing-absinthe-exunit/)

## Scratchpad

**DONE**

- write a simple "hello world" GraphQL endpoint.
- write a test for `posts` endpoint

**DOING**

**TODO**

- remove the `hello` endpoint
- disable DEBUG output messages for Absinthe
- retrieve only one `post`
- try to create a relationship between `post` and `author`
- create a new `post`
- update an existing `post`
- delete an existing `post`
- try to put a GraphQL API to the `elixir_bank_account`
