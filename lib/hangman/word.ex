defmodule Hangman.Word do
  use Hangman.Web, :model
  use Ecto.Model

  schema "words" do
    field :content, :string

    belongs_to :category, Hangman.Category
    timestamps
  end

  @required_fields ~w(content)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> update_change(:content, &String.downcase/1)
  end

end
