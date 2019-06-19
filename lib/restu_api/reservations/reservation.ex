defmodule RestuAPI.Reservations.Reservation do
  use Ecto.Schema
  import Ecto.Changeset
  alias RestuAPI.Tables.Table


  schema "reservations" do
    field :email, :string
    field :name, :string
    field :reserve_date, :naive_datetime
    field :reserve_end_time, :time
    field :reserve_start_time, :time
    field :phone, :string
    field :seats, :integer

    belongs_to :tables, Table, foreign_key: :table_id

    timestamps()
  end

  @doc false
  def changeset(reservation, attrs) do
    reservation
    |> cast(attrs, [:table_id, :name, :email, :phone, :seats, :reserve_date, :reserve_start_time, :reserve_end_time])
    |> validate_required([:table_id, :name, :email, :phone, :seats, :reserve_date, :reserve_start_time, :reserve_end_time])
    |> unique_constraint(:name)
    |> unique_constraint(:email)
   end
end
