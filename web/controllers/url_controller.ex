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
        conn
        |> put_status(:created)
        |> render("new.json", url: url)
    end
  end

  def show(conn, %{"short_url" => short_url}) do
    url = Repo.get_by(Url, short_url: short_url)
    redirect conn, external: url.original_url
  end
end
