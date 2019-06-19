defmodule RestuAPI.ResturantsGroups.ResturantGroup do
  use Ecto.Schema
  import Ecto.Changeset


  schema "resturants_groups" do
    field :is_active, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(resturant_group, attrs) do
    resturant_group
    |> cast(attrs, [:name, :is_active])
    |> validate_required([:name, :is_active])
    |> unique_constraint(:name)
  end
end
