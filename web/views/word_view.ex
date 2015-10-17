defmodule Hangman.WordView do
  use Hangman.Web, :view

  alias Hangman.Word

  def render("index.json", %{ :words => params }) do
    params
  end

  defimpl Poison.Encoder, for: Hangman.Word do
    def encode(page, _options) do
      %{
        content: page.content
      } |> Poison.Encoder.encode([])
    end
  end

end
