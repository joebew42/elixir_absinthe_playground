defmodule ElixirAbsinthePlayground.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elixir_absinthe_playground,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ElixirAbsinthePlayground.Application, []}
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 1.1"},
      {:plug, "~> 1.4"},
      {:absinthe_plug, "~> 1.4"}
    ]
  end
end
