defmodule Hangman.MasterCatController do
  use Hangman.Web, :controller

  alias Hangman.MasterCat
  alias Hangman.Category

  def index(conn, _params) do
    query = from p in MasterCat,
      select: p

    a = Repo.all(query)

    IO.inspect(a)

    render conn, "index.json", mastercats: a
  end

  def create(conn, %{ "mastercats" => params }) do
    IO.inspect(params)
    a = MasterCat.changeset(%MasterCat{},params)
    Repo.insert(a)

    json conn, %{ "success" => a.valid?, "errors" => a.errors }
  end

  def create(conn, _) do
    json conn, %{ "success" => false, "errors" => "wrong params"}
  end

end
