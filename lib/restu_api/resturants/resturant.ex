defmodule RestuAPI.Restaurants.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset
  alias RestuAPI.Tables.Table

  schema "restaurants" do
    field :address, :string
    field :city, :string
    field :is_active, :boolean
    field :latitude, :float
    field :longitude, :float
    field :name, :string
    field :neighborhood, :string
    field :zipCode, :string

    has_many :tables, Table

    timestamps()
  end

  @doc false
  def changeset(restaurant, attrs) do
    restaurant
    |> cast(attrs, [:name, :address, :city, :is_active, :neighborhood, :zipCode, :latitude, :longitude])
    |> validate_required([:name, :address, :city, :is_active, :neighborhood, :zipCode, :latitude, :longitude])
    |> unique_constraint(:name)
  end
end
