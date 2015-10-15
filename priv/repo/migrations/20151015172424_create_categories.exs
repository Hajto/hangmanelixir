defmodule Hangman.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :word_id, references(:words)
    end
  end
end
