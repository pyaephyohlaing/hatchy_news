defmodule HatchyNews.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :name, :string
      add :title, :string
      add :description, :string
      add :url, :string
      add :urlToImage, :string
      add :publishedAt, :string
      add :user_id, references(:users)

      timestamps()
    end

    
  end
end
