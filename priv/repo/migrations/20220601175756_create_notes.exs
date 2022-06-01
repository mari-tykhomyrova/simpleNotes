defmodule SimpleNotes.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :"text", :string

      timestamps()
    end
  end
end
