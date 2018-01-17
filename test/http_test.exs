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

    result = do_graphql_request("/api", query, "posts")

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

    result = do_graphql_request("/api", query, "post")

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

    errors = do_graphql_request("/api", query, "post")

    assert contains?(errors, "Post with ID 999 not found")
  end

  defp contains?(enumerable, element) do
    Enum.member?(enumerable, element)
  end

  defp do_graphql_request(endpoint, query, query_name) do
    conn(:post, endpoint, graphql_payload(query, query_name))
    |> @router.call(@opts)
    |> graphql_body_for(query_name)
  end

  defp graphql_body_for(%Plug.Conn{"resp_body": response_body}, query_name) do
    case Poison.decode!(response_body) do
      %{"data" => %{^query_name => nil}, "errors" => errors} ->
        Enum.map(errors, fn(%{"message" => message}) -> message end)
      %{"data" => %{^query_name => body}} ->
        body
    end
  end

  defp graphql_payload(query, name) do
    %{
      "operationName" => "#{name}",
      "query" => "query #{name} #{query}",
      "variables" => "{}"
    }
  end
end
