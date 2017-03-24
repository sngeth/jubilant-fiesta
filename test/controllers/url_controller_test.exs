defmodule UrlShot.UrlControllerTest do
  use UrlShot.ConnCase
  import UrlShot.Factory
  alias UrlShot.Url

  test "GET /new", %{conn: conn} do
    conn = get conn, "/api/new/www.google.com"

    new_url = Repo.get_by(Url, original_url: "www.google.com")

    assert json_response(conn, 201) == %{
      "original_url" => "www.google.com",
      "short_url" => new_url.short_url
    }
  end

  test "GET /:short_url", %{conn: conn} do
    new_url = insert(:url)

    conn = get conn, "/#{new_url.short_url}"

    assert redirected_to(conn) =~ new_url.original_url
  end
end
