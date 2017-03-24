defmodule UrlShot.UrlView do
  use UrlShot.Web, :view
  alias UrlShot.UrlGenerator

  def render("new.json", %{url: url}) do
    %{
      original_url: url.original_url,
      short_url: url.short_url
    }
  end
end
