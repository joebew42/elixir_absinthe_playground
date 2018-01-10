defmodule Types do
  use Absinthe.Schema.Notation

  object :post do
    field :title, :string
    field :body, :string
  end
end
