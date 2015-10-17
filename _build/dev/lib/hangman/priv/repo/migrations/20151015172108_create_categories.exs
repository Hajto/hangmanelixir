defmodule Hangman.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :mastercat_id, references(:mastercats)

      timestamps
    end
  end
end
