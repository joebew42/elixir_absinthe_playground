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

  def create_post(_parent, args, _resolution) do
    {:ok, %{"title": Map.get(args, :title), "body": Map.get(args, :body)}}
  end

  def update_post(_parent, %{id: id}, _resolution) when id == "999" do
    {:error, "Post with ID #{id} not found"}
  end
  def update_post(_parent, args, _resolution) do
    {:ok, %{"title": Map.get(args, :title), "body": Map.get(args, :body)}}
  end

  def delete_post(_parent, %{id: id}, _resolution) do
    {:ok, %{"id": id}}
  end
end
