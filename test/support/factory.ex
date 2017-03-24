defmodule UrlShot.Factory do
  use ExMachina.Ecto, repo: UrlShot.Repo
  alias UrlShot.UrlGenerator

  def url_factory do
    %UrlShot.Url{
      original_url: "www.google.com",
      short_url: UrlGenerator.generate
    }
  end
end
