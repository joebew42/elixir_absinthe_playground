defmodule Schema do
  use Absinthe.Schema
  import_types Types

  alias Resolvers

  query do
    @desc "Get the single post"
    field :post, :post do
      arg :id, non_null(:id)
      resolve &Resolvers.find_post/3
    end

    @desc "Get the list of posts"
    field :posts, list_of(:post) do
      resolve &Resolvers.list_posts/3
    end
  end

end
