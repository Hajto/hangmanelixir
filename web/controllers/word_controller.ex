defmodule Hangman.WordController do
  use Hangman.Web, :controller

  def new(conn, _params) do
    text(conn, "")
  end

end
