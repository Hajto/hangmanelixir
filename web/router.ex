defmodule Hangman.Router do
  use Hangman.Web, :router

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

  scope "/", Hangman do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/mastercat", Hangman do
    pipe_through :api

    resources "/", MasterCatController
  end

  scope "/category", Hangman do
    pipe_through :api

    resources "/", CategoryController
  end

  scope "/words", Hangman do
    pipe_through :api

    resources "/", WordController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Hangman do
  #   pipe_through :api
  # end
end
