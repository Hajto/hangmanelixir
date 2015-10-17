defmodule Hangman.WordController do
  use Hangman.Web, :controller

  alias Hangman.Word
  alias Hangman.ResponseUtils

  def index(conn, _params) do
    return = Repo.all(Word)

    IO.inspect(return)

    render conn, "index.json", words: return
  end

  def create(conn, %{ "word" => params, "parent" => parent_id }) do
    parent = Repo.get(Hangman.Category, parent_id)
    changeset = build(parent, :words)
      |> Word.changeset( params)
    IO.inspect(changeset)
    if changeset.valid? do
      Repo.insert(changeset)
      json conn, ResponseUtils.jsonResponse(true)
    else
      json conn, ResponseUtils.jsonResponse(false,["parents doesn't exist"])
    end
  end

end
