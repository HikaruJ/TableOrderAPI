defmodule RestuAPI.Tables.Table do
  use Ecto.Schema
  import Ecto.Changeset
  alias RestuAPI.Restaurants.Restaurant
  alias RestuAPI.Reservations.Reservation


  schema "tables" do
    field :assigned_number, :integer
    field :max_seats, :integer
    field :min_seats, :integer
    field :description, :string

    belongs_to :restaurants, Restaurant, foreign_key: :restaurant_id
    has_many :reservations, Reservation

    timestamps()
  end

  @doc false
  def changeset(table, attrs) do
    table
    |> cast(attrs, [:restaurant_id, :assigned_number, :max_seats, :min_seats, :description])
    |> validate_required([:restaurant_id, :assigned_number, :max_seats, :min_seats, :description])
  end
end
