defmodule TableOrderAPI.Tables do
  @moduledoc """
  The Tables context.
  """

  import Ecto.Query, warn: false

  alias TableOrderAPI.Repo
  alias TableOrderAPI.Reservations.Reservation
  alias TableOrderAPI.Tables.Table

  @doc """
    Creates a table.
  """
  def create_table(attrs \\ %{}) do
    %Table{}
    |> Table.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:reservations, with: &Reservation.changeset/2)
    |> Repo.insert()
  end

  @doc """
    Retrieve available tables for a restaurant at a give period of time
  """
  def open_tables(from_date, restaurant_id, to_date) do
    Repo.all from table in Table,
      left_join: reservation in Reservation,
      on: table.id == reservation.table_id,
      where: table.restaurant_id == ^restaurant_id and
        (reservation.order_end_time < ^from_date or
        reservation.order_start_time > ^to_date or
        is_nil(reservation.order_start_time)),
      select: table,
      order_by: [table.assigned_number]
  end
end
