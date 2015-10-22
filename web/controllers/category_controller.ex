defmodule Hangman.CategoryController do
  use Hangman.Web, :controller

  alias Hangman.Category
  alias Hangman.MasterCat
  alias Hangman.ResponseUtils

  def index(conn, _params) do
    return = Repo.all from c in Category,
      preload: [:mastercat]

    IO.inspect(return)

    render conn, "index.json", categories: return
  end

  def create(conn, %{ "category" => params, "parent" => parent_id }) do
    parent = Repo.get(Hangman.MasterCat, parent_id)
    changeset = build(parent, :categories)
      |> Category.changeset( params)
    IO.inspect(changeset)
    case Repo.insert(changeset) do
      { :ok, _ } -> json conn, ResponseUtils.jsonResponse(true)
      { :error,  _ } -> json conn, ResponseUtils.jsonResponse(false,[])
    end
  end

end
