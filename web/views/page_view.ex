defmodule Hangman.PageView do
  use Hangman.Web, :view

  def render("index.json", %{ :things => params} ), do: params

end
