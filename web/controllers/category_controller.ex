defmodule Hangman.CategoryController do
  use Hangman.Web, :controller

  alias Hangman.Category
  alias Hangman.ResponseUtils

  def create(conn, %{ "category" => params, "parent" => parent_id }) do

    parent = Repo.get(Hangman.MasterCat, parent_id)
    changeset = build(parent, :categories)
      |> Category.changeset( params)
    IO.inspect(changeset)

    if changeset.valid? do
      Repo.insert(changeset)
      json conn, ResponseUtils.jsonResponse(true)
    else
      json conn, ResponseUtils.jsonResponse(false,["parents doesn't exist"])
    end

  end

end
