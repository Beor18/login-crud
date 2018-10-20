defmodule LoginEjemplo.Post do
  use LoginEjemplo.Web, :model
  use Arc.Ecto.Schema 

  schema "posts" do
    field :titulo, :string
    field :cuerpo, :string
    field :colectivos, :string
    field :image, LoginEjemplo.ImageUploader.Type

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:titulo, :cuerpo, :colectivos, :image])
    |> cast_attachments(params, [:image])
    |> validate_required([:titulo, :cuerpo, :colectivos])
  end
end
