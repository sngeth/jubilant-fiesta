defmodule UrlShot.UrlController do
  use UrlShot.Web, :controller
  alias UrlShot.Url
  alias UrlShot.UrlGenerator

  def new(conn, %{"original_url" => original_url}) do
    short_url = UrlGenerator.generate

    params = %{ original_url: original_url,
                short_url: short_url }

    changeset = Url.changeset(%Url{}, params)

    case Repo.insert(changeset) do
      {:ok, url} ->
        render(conn, "new.json", url: url, status: 201)
    end
  end
end
