defmodule ImgurUpload.Router do
  use ImgurUpload.Web, :router

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

  scope "/", ImgurUpload do
    pipe_through :browser # Use the default browser stack

    resources "/image", ImageController
    get "/", ImageController, :index
    #get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ImgurUpload do
  #   pipe_through :api
  # end
end
