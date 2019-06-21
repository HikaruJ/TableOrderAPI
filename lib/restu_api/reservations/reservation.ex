defmodule TableOrderAPI.Reservations.Reservation do
  use Ecto.Schema
  import Ecto.Changeset
  alias TableOrderAPI.Tables.Table

  schema "reservations" do
    field :email, :string
    field :name, :string
    field :order_end_time, :utc_datetime 
    field :order_start_time, :utc_datetime 
    field :phone, :string
    field :seats, :integer

    belongs_to :tables, Table, foreign_key: :table_id

    timestamps(type: :utc_datetime)
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
