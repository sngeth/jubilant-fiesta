defmodule UrlShot.Url do
  use UrlShot.Web, :model

  schema "urls" do
    field :original_url
    field :short_url

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:original_url, :short_url])
  end
end
