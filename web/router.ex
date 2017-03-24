defmodule UrlShot.Router do
  use UrlShot.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UrlShot do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/:short_url", UrlController, :show
  end

  scope "/api", UrlShot do
    pipe_through :api

    get "/new/:original_url", UrlController, :new
  end
end
