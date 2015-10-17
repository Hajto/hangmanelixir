defmodule Hangman.PageController do
  use Hangman.Web, :controller

  def index(conn, _params) do
    ret = Repo.all from m in Hangman.MasterCat,
      join: c in assoc(m, :categories),
      preload: [categories: c],
      select: m

    IO.inspect(ret)

    render conn, "index.json", things: ret
  end
end
