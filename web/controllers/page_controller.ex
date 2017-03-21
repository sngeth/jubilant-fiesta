defmodule UrlShot.PageController do
  use UrlShot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
