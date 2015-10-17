defmodule Hangman.MasterCat do
  use Hangman.Web, :model

  schema "mastercats" do
    field :name, :string

    has_many :categories, Hangman.Category
  end

  @required_fields ~w(name )
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
