defmodule Resolvers do
  def find_post(_parent, _args, _resolution) do
    {:ok,  %{"title": "A first blog post", "body": "this is the body"}}
  end

  def list_posts(_parent, _args, _resolution) do
    {:ok, [
        %{"title": "A first blog post", "body": "this is the body"},
        %{"title": "A second blog post", "body": "this is the second body"}]
    }
  end
end
