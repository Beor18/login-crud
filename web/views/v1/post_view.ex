defmodule LoginEjemplo.V1.PostView do
  use LoginEjemplo.Web, :view

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, LoginEjemplo.V1.PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, LoginEjemplo.V1.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      titulo: post.titulo,
      cuerpo: post.cuerpo}
  end
end
