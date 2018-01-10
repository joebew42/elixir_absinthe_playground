defmodule HttpTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @router Http
  @opts @router.init([])

  test "should receive hello world" do
    conn = conn(:get, "/hello")
    |> @router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "hello world"
  end
end
