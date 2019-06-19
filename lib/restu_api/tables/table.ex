defmodule RestuAPI.Tables.Table do
  use Ecto.Schema
  import Ecto.Changeset
  alias RestuAPI.Resturants.Resturant
  alias RestuAPI.Reservations.Reservation


  schema "tables" do
    field :assigned_number, :integer
    field :max_seats, :integer
    field :min_seats, :integer
    field :description, :string

    belongs_to :resturants, Resturant, foreign_key: :resturant_id
    has_many :reservations, Reservation

    timestamps()
  end

  @doc false
  def changeset(table, attrs) do
    table
    |> cast(attrs, [:resturant_id, :assigned_number, :max_seats, :min_seats, :description])
    |> validate_required([:resturant_id, :assigned_number, :max_seats, :min_seats, :description])
  end
end
