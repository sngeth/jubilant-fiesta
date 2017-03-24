defmodule UrlShot.UrlControllerTest do
  use UrlShot.ConnCase
  import UrlShot.Factory
  alias UrlShot.Url

  test "GET /new", %{conn: conn} do
    conn = get conn, "/api/new/www.google.com"

    new_url = Url |> first |> Repo.one

    assert json_response(conn, 200) == %{
      "original_url" => "www.google.com",
      "short_url" => new_url.short_url
    }
  end
end
