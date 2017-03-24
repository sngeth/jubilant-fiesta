defmodule UrlShot.Url do
  use UrlShot.Web, :model

  schema "urls" do
    field :original_url
    field :short_url

    timestamps()
  end
end
