defmodule HatchyNewsWeb.PostView do
    use HatchyNewsWeb, :view
    alias HatchyNewsWeb.PostView

    def render("index.json", %{posts: posts}) do
      %{data: render_many(posts, PostView, "post.json")}
    end

  
    def render("post.json", %{post: post}) do
      %{
        id: post.id,
        name: post.name,
        title: post.title,
        description: post.description,
        url: post.url,
        urlToImage: post.urlToImage,
        publishedAt: post.publishedAt
      }
    end
  end
  