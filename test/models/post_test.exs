defmodule LoginEjemplo.PostTest do
  use LoginEjemplo.ModelCase

  alias LoginEjemplo.Post

  @valid_attrs %{cuerpo: "some cuerpo", titulo: "some titulo"}
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
