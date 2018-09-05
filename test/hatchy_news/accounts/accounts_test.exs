defmodule HatchyNews.AccountsTest do
  use HatchyNews.DataCase

  alias HatchyNews.Accounts

  describe "users" do
    alias HatchyNews.Accounts.User

    @valid_attrs %{email: "some email", google_token: "some google_token", google_uid: "some google_uid", image_url: "some image_url", name: "some name", verify_email: true}
    @update_attrs %{email: "some updated email", google_token: "some updated google_token", google_uid: "some updated google_uid", image_url: "some updated image_url", name: "some updated name", verify_email: false}
    @invalid_attrs %{email: nil, google_token: nil, google_uid: nil, image_url: nil, name: nil, verify_email: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.google_token == "some google_token"
      assert user.google_uid == "some google_uid"
      assert user.image_url == "some image_url"
      assert user.name == "some name"
      assert user.verify_email == true
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.google_token == "some updated google_token"
      assert user.google_uid == "some updated google_uid"
      assert user.image_url == "some updated image_url"
      assert user.name == "some updated name"
      assert user.verify_email == false
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "users" do
    alias HatchyNews.Accounts.User

    @valid_attrs %{email: "some email", google_token: "some google_token", google_uid: "some google_uid", image_url: "some image_url", name: "some name"}
    @update_attrs %{email: "some updated email", google_token: "some updated google_token", google_uid: "some updated google_uid", image_url: "some updated image_url", name: "some updated name"}
    @invalid_attrs %{email: nil, google_token: nil, google_uid: nil, image_url: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.google_token == "some google_token"
      assert user.google_uid == "some google_uid"
      assert user.image_url == "some image_url"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.google_token == "some updated google_token"
      assert user.google_uid == "some updated google_uid"
      assert user.image_url == "some updated image_url"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
