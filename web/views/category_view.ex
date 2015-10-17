defmodule Hangman.CategoryView do
  use Hangman.Web, :view

  def render("index.json", %{ :categories => params }) do
    params
  end

  def render("index.json", params ) do
    IO.inspect(params)
    "co sie spierdolilo"
  end

  def forcePreload( [] ), do: []
  def forcePreload( a ), do: Hangman.Repo.preload(a, :words)

  defimpl Poison.Encoder, for: Hangman.Category do
    def encode(category, _options) do
      IO.inspect(category.words)
      %{
        id: category.id,
        name: category.name,
        words: Hangman.CategoryView.forcePreload(category).words
      } |> Poison.Encoder.encode([])
    end
    #,    mastercat: Hangman.ModelUtils.isAnythingLoaded(category.mastercat.name),
  end



end
