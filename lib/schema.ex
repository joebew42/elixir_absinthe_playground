defmodule Schema do
  use Absinthe.Schema
  import_types Types

  alias Resolvers

  query do
    @desc "Get the list of posts"
    field :posts, list_of(:post) do
      resolve &Resolvers.list_posts/3
    end
  end

end
