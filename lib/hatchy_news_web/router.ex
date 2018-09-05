defmodule HatchyNewsWeb.Router do
  use HatchyNewsWeb, :router

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

  scope "/", HatchyNewsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/post/create", NewsController, :create 
    post "/post/delete/:id", NewsController, :delete
    get "/post/show", NewsController, :show
  end

  #Oauth for Google 
  scope "/auth", HatchyNewsWeb do
    pipe_through :api

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback

  end
end
