defmodule HatchyNews.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :google_uid, :string
    field :name, :string
    has_many :news, HatchyNews.News.Post

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :google_uid])
    |> validate_required([:email, :google_uid])
  end
end
