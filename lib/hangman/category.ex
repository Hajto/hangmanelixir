defmodule Hangman.Category do
  use Hangman.Web, :model

  schema "categories" do
    field :name, :string

    has_many :words, Hangman.Word
    belongs_to :mastercat, Hangman.MasterCat, foreign_key: :mastercat_id

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

end
