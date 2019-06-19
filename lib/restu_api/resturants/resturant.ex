defmodule RestuAPI.Resturants.Resturant do
  use Ecto.Schema
  import Ecto.Changeset
  alias RestuAPI.Tables.Table

  schema "resturants" do
    field :address, :string
    field :city, :string
    field :is_active, :boolean
    field :latitude, :float
    field :longitude, :float
    field :name, :string
    field :neighberhood, :string
    field :zipCode, :string

    has_many :tables, Table

    timestamps()
  end

  @doc false
  def changeset(resturant, attrs) do
    resturant
    |> cast(attrs, [:name, :address, :city, :is_active, :neighberhood, :zipCode, :latitude, :longitude])
    |> validate_required([:name, :address, :city, :is_active, :neighberhood, :zipCode, :latitude, :longitude])
    |> unique_constraint(:name)
  end
end
