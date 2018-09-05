defmodule HatchyNewsWeb.NewsController do
    use HatchyNewsWeb, :controller

    alias HatchyNews.News
    alias HatchyNews.Accounts.User
    alias HatchyNews.News.Post
    alias HatchyNews.Repo
    import Ecto.Query


    def create(conn, post_params) do
        # %{
        #     "name" => "pyaephyohlaing",
        #     "title" => "pyaephyohlaing",
        #     "description" => "I'm a pyaephyohlaing",
        #     "url" => "www.google.com",
        #     "urlToImage" => "www.pyaephyohlaing.com",
        #     "publishedAt" => "Google",
        #     "user_id" => 18
        # }
        with {:ok, %Post{} = post} <- News.create_post(post_params) do
            conn
            |> put_status(:created)
            |> render(HatchyNewsWeb.PostView, "post.json", post: post)
        end
    end

    def show(conn, %{"id"=> id} = user_id) do
        id = String.to_integer(id)
        bookmark = Repo.all(
            from p in Post,
            where: p.user_id == ^id,
            select: p
        )
        conn
        |> render(HatchyNewsWeb.PostView, "index.json", posts: bookmark)
    end

    def delete(conn,%{"id" => id}) do
        post = News.get_post!(id)
        IO.inspect "post"
        IO.inspect post
        with {:ok, %Post{} = post} <- News.delete_post(post) do
            conn
            |> put_status(:deleted)
        end
    end

  end
  