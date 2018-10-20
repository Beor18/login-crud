defmodule LoginEjemplo.V1.PostTest do
  use LoginEjemplo.ModelCase

  alias LoginEjemplo.V1.Post

  @valid_attrs %{cuerpo: "some content", titulo: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end
