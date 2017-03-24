defmodule UrlShot.UrlController do
  use UrlShot.Web, :controller

  def new(conn, %{"original_url" => original_url}) do
    render conn, "new.json", original_url: original_url
  end
end
