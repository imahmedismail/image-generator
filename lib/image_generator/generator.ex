defmodule ImageGenerator.Generator do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "generator" do
    field :title, :string
  end

  def changeset(generator, attrs) do
    generator
    |> cast(attrs, [:title])
  end
end
