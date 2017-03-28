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
    case Repo.get_by(UrlShot.Url, short_url: short_url) do
      nil ->
        conn |> put_status(:not_found) |> render(UrlShot.ErrorView, "404.html")
      url ->
        redirect conn, external: url_with_protocol(url.original_url)
    end
  end

  defp url_with_protocol(url) do
    protocol = ~r/^((http|https|ftp):\/\/)/

    if Regex.match?(protocol, url) do
      url
    else
      "http://#{url}"
    end
  end
end
