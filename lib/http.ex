defmodule Http do
  use Plug.Router

  plug :match
  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: ["*/*"],
    json_decoder: Poison
  plug :dispatch

  forward "/api",
    to: Absinthe.Plug,
    init_opts: [schema: Schema]

  forward "/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [schema: Schema]

  get "/hello" do
    send_resp(conn, 200, "hello world")
  end
end
