defmodule HatchyNews.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :name, :string
      add :google_uid, :string

      timestamps()
    end

  end
end
