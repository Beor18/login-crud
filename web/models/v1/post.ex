defmodule LoginEjemplo.V1.Post do
  use LoginEjemplo.Web, :model

  schema "posts" do
    field :titulo, :string
    field :cuerpo, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:titulo, :cuerpo])
    |> validate_required([:titulo, :cuerpo])
  end
end