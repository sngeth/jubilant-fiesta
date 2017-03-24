defmodule UrlShot.UrlControllerTest do
  use UrlShot.ConnCase
  import UrlShot.Factory

  test "GET /new", %{conn: conn} do
    conn = build_conn()
    shortened_url = insert(:url)

    conn = get conn, "/api/new/www.google.com"

    assert json_response(conn, 200) == %{
      "original_url" => "www.google.com"
    }
  end
end
