defmodule HttpTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @router Http
  @opts @router.init([])

  test "should get all posts" do
    query = """
      {
        posts {
          title
          body
        }
      }
      """

    result = do_graphql_query("/api", query, "posts")

    assert contains?(result, %{"title" => "A first blog post", "body" => "this is the body"})
    assert contains?(result, %{"title" => "A second blog post", "body" => "this is the second body"})
  end

  test "should get a post" do
    query = """
      {
        post(id: 1) {
          title
          body
        }
      }
      """

    result = do_graphql_query("/api", query, "post")

    assert result == %{"title" => "A first blog post", "body" => "this is the body"}
  end

  test "should get a not found error if the post does not exists" do
    query = """
      {
        post(id: 999) {
          title
          body
        }
      }
      """

    errors = do_graphql_query("/api", query, "post")

    assert contains?(errors, "Post with ID 999 not found")
  end

  test "should get a post and its author" do
    query = """
      {
        post(id: 1) {
          title
          body
          author {
            name
            email
          }
        }
      }
      """

    result = do_graphql_query("/api", query, "post")

    assert result == %{
      "title" => "A first blog post",
      "body" => "this is the body",
      "author" => %{
        "name" => "joe",
        "email" => "joe@somewhere.com"}}
  end

  test "should create a new post" do
    query = """
      mutation CreatePost {
        createPost(title: "A new post is born!", body: "something") {
          title
          body
        }
      }
      """

    result = do_graphql_mutation("/api", query, "CreatePost", "createPost")

    assert result == %{"title" => "A new post is born!", "body" => "something"}
  end

  defp contains?(enumerable, element) do
    Enum.member?(enumerable, element)
  end

  defp do_graphql_query(endpoint, query, query_name) do
    conn(:post, endpoint, graphql_payload(query, query_name))
    |> @router.call(@opts)
    |> graphql_body_for(query_name)
  end

  defp do_graphql_mutation(endpoint, query, operation_name, query_name) do
    conn(:post, endpoint, graphql_mutation_payload(query, operation_name))
    |> @router.call(@opts)
    |> graphql_body_for(query_name)
  end

  defp graphql_payload(query, name) do
    %{
      "operationName" => "#{name}",
      "query" => "query #{name} #{query}",
      "variables" => "{}"
    }
  end

  defp graphql_mutation_payload(query, operation_name) do
    %{
      "operationName" => "#{operation_name}",
      "query" => "#{query}",
      "variables" => "{}"
    }
  end

  defp graphql_body_for(%Plug.Conn{"resp_body": response_body}, query_name) do
    case Poison.decode!(response_body) do
      %{"data" => %{^query_name => nil}, "errors" => errors} ->
        Enum.map(errors, fn(%{"message" => message}) -> message end)
      %{"data" => %{^query_name => body}} ->
        body
    end
  end
end
