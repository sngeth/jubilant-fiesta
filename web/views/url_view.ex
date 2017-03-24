defmodule UrlShot.UrlView do
  use UrlShot.Web, :view
  alias UrlShot.UrlGenerator

  def render("new.json", %{original_url: original_url}) do
    %{
      "original_url" => original_url,
    }
  end
end
