defmodule Resolvers do
  def find_post(_parent, %{id: id}, _resolution) when id == "999" do
    {:error, "Post with ID #{id} not found"}
  end
  def find_post(_parent, _args, _resolution) do
    {:ok,  %{
        "title": "A first blog post",
        "body": "this is the body",
        "author": %{"name": "joe",
                    "email": "joe@somewhere.com"}
        }
    }
  end

  def list_posts(_parent, _args, _resolution) do
    {:ok, [
        %{"title": "A first blog post", "body": "this is the body"},
        %{"title": "A second blog post", "body": "this is the second body"}]
    }
  end
end
