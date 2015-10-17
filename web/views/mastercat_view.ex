defmodule Hangman.MasterCatView do
  use Hangman.Web, :view

  alias Hangman.MasterCat

  def render("index.json", %{ :mastercats => params }) do
    params
  end

  def render("index.json", params ) do
    IO.inspect(params)
    "co sie spierdolilo"
  end

  defimpl Poison.Encoder, for: Hangman.MasterCat do
    def encode(page, _options) do
      %{
        id: page.id,
        name: page.name,
        categories: page.categories
      } |> Poison.Encoder.encode([])
    end
  end

end
