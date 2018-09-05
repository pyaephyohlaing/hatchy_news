defmodule HatchyNews.BookmarkTest do
  use HatchyNews.DataCase

  alias HatchyNews.Bookmark

  describe "news" do
    alias HatchyNews.Bookmark.New

    @valid_attrs %{author: "some author", description: "some description", publishedAt: "some publishedAt", title: "some title", url: "some url", urlToImage: "some urlToImage", user_id: 42}
    @update_attrs %{author: "some updated author", description: "some updated description", publishedAt: "some updated publishedAt", title: "some updated title", url: "some updated url", urlToImage: "some updated urlToImage", user_id: 43}
    @invalid_attrs %{author: nil, description: nil, publishedAt: nil, title: nil, url: nil, urlToImage: nil, user_id: nil}

    def new_fixture(attrs \\ %{}) do
      {:ok, new} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bookmark.create_new()

      new
    end

    test "list_news/0 returns all news" do
      new = new_fixture()
      assert Bookmark.list_news() == [new]
    end

    test "get_new!/1 returns the new with given id" do
      new = new_fixture()
      assert Bookmark.get_new!(new.id) == new
    end

    test "create_new/1 with valid data creates a new" do
      assert {:ok, %New{} = new} = Bookmark.create_new(@valid_attrs)
      assert new.author == "some author"
      assert new.description == "some description"
      assert new.publishedAt == "some publishedAt"
      assert new.title == "some title"
      assert new.url == "some url"
      assert new.urlToImage == "some urlToImage"
      assert new.user_id == 42
    end

    test "create_new/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookmark.create_new(@invalid_attrs)
    end

    test "update_new/2 with valid data updates the new" do
      new = new_fixture()
      assert {:ok, new} = Bookmark.update_new(new, @update_attrs)
      assert %New{} = new
      assert new.author == "some updated author"
      assert new.description == "some updated description"
      assert new.publishedAt == "some updated publishedAt"
      assert new.title == "some updated title"
      assert new.url == "some updated url"
      assert new.urlToImage == "some updated urlToImage"
      assert new.user_id == 43
    end

    test "update_new/2 with invalid data returns error changeset" do
      new = new_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookmark.update_new(new, @invalid_attrs)
      assert new == Bookmark.get_new!(new.id)
    end

    test "delete_new/1 deletes the new" do
      new = new_fixture()
      assert {:ok, %New{}} = Bookmark.delete_new(new)
      assert_raise Ecto.NoResultsError, fn -> Bookmark.get_new!(new.id) end
    end

    test "change_new/1 returns a new changeset" do
      new = new_fixture()
      assert %Ecto.Changeset{} = Bookmark.change_new(new)
    end
  end
end
