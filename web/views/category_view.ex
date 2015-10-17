defmodule Hangman.CategoryView do
  use Hangman.Web, :view

  alias Hangman.MasterCat

  def render("index.json", %{ :categories => params }) do
    params
  end

  def render("index.json", params ) do
    IO.inspect(params)
    "co sie spierdolilo"
  end

  defimpl Poison.Encoder, for: Hangman.Category do
    def encode(category, _options) do
      %{
        id: category.id,
        name: category.name
      } |> Poison.Encoder.encode([])
    end
  end

end
