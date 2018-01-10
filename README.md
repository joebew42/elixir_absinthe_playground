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

## Known issues

At the moment every time we try to make a query we get:

```
{
  "errors": [
    {
      "message": "syntax error before: \"\\\"query\\\"\"",
      "locations": [
        {
          "line": 1,
          "column": 0
        }
      ]
    }
  ]
}
```

## Scratchpad

**DONE**

**DOING**

- write a simple "hello world" GraphQL endpoint.

**TODO**
