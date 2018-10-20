defmodule LoginEjemplo.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :titulo, :string
      add :cuerpo, :text
      add :colectivos, :text 

      timestamps()
    end
  end
end
