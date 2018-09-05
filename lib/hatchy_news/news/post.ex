defmodule HatchyNews.News.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :name, :string
    field :description, :string
    field :publishedAt, :string
    field :title, :string
    field :url, :string
    field :urlToImage, :string
    belongs_to :user, HatchyNews.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name, :title, :description, :url, :urlToImage, :publishedAt, :user_id])
    |> validate_required([:name, :title, :description, :url, :urlToImage, :publishedAt, :user_id])
  end
end
