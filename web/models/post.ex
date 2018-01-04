defmodule LoginEjemplo.Post do
  use LoginEjemplo.Web, :model

  schema "posts" do
    field :titulo, :string
    field :cuerpo, :string
    field :colectivos, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:titulo, :cuerpo, :colectivos])
    |> validate_required([:titulo, :cuerpo, :colectivos])
  end
end
