defmodule ElixirAbsinthePlayground.Application do
  use Application

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Http, [], [port: 4000])
    ]

    opts = [strategy: :one_for_one, name: ElixirAbsinthePlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
