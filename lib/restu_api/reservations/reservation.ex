defmodule RestuAPI.Reservations.Reservation do
  use Ecto.Schema
  import Ecto.Changeset
  alias RestuAPI.Tables.Table

  schema "reservations" do
    field :email, :string
    field :name, :string
    field :order_end_time, :naive_datetime
    field :order_start_time, :naive_datetime
    field :phone, :string
    field :seats, :integer

    belongs_to :tables, Table, foreign_key: :table_id

    timestamps()
  end

  @doc false
  def changeset(reservation, attrs) do
    reservation
    |> cast(attrs, [:table_id, :name, :email, :phone, :seats, :order_start_time, :order_end_time])
    |> validate_required([:table_id, :name, :email, :phone, :seats, :order_start_time, :order_end_time])
    |> unique_constraint(:name)
    |> unique_constraint(:email)
   end
end
