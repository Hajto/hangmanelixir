defmodule Hangman.Category do
  use Hangman.Web, :model

  schema "categories" do
    field :name, :string

    has_many :words, Hangman.Word
  end

end
