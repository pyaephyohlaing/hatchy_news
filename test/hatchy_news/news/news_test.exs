defmodule HatchyNews.NewsTest do
  use HatchyNews.DataCase

  alias HatchyNews.News

  describe "posts" do
    alias HatchyNews.News.Post

    @valid_attrs %{author: "some author", description: "some description", publishedAt: "some publishedAt", title: "some title", url: "some url", urlToImage: "some urlToImage"}
    @update_attrs %{author: "some updated author", description: "some updated description", publishedAt: "some updated publishedAt", title: "some updated title", url: "some updated url", urlToImage: "some updated urlToImage"}
    @invalid_attrs %{author: nil, description: nil, publishedAt: nil, title: nil, url: nil, urlToImage: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> News.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert News.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert News.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = News.create_post(@valid_attrs)
      assert post.author == "some author"
      assert post.description == "some description"
      assert post.publishedAt == "some publishedAt"
      assert post.title == "some title"
      assert post.url == "some url"
      assert post.urlToImage == "some urlToImage"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = News.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, post} = News.update_post(post, @update_attrs)
      assert %Post{} = post
      assert post.author == "some updated author"
      assert post.description == "some updated description"
      assert post.publishedAt == "some updated publishedAt"
      assert post.title == "some updated title"
      assert post.url == "some updated url"
      assert post.urlToImage == "some updated urlToImage"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = News.update_post(post, @invalid_attrs)
      assert post == News.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = News.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> News.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = News.change_post(post)
    end
  end
end
