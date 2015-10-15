defmodule Hangman.Word do
  use Hangman.Web, :model

  schema "words" do
    field :content, :string

    belongs_to :category, Hangman.Category
    timestamps
  end
end
