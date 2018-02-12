defmodule Types do
  use Absinthe.Schema.Notation

  object :author do
    field :name, :string
    field :email, :string
  end

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
    field :author, :author
  end
end
