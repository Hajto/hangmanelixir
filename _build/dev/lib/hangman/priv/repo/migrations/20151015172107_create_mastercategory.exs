defmodule Hangman.Repo.Migrations.CreateMastercategory do
  use Ecto.Migration

  def change do
    create table(:mastercats) do
      add :name, :string
    end
  end
end
