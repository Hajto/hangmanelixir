defmodule Hangman.MasterCatController do
  use Hangman.Web, :controller

  alias Hangman.MasterCat
  alias Hangman.Category

  def index(conn, _params) do
    query = from p in MasterCat,
      join: c in Category,
      on: p.id == c.mastercat_id,
      select: p

    a = Repo.all(query)
    render conn, "index.json", mastercats: a
  end

  def create(conn, %{ "mastercats" => params }) do
    IO.inspect(params)
    a = MasterCat.changeset(%MasterCat{},params)
    Repo.insert(a)
    text(conn, a.valid?)
  end

end
