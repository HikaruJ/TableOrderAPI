defmodule RestuAPI.Tables do
  @moduledoc """
  The Tables context.
  """

  import Ecto.Query, warn: false

  alias RestuAPI.Repo
  alias RestuAPI.Reservations.Reservation
  alias RestuAPI.Restaurants
  alias RestuAPI.Tables.Table

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
    Gets a single table.
    Raises `Ecto.NoResultsError` if the Table does not exist.
  """
  def get_table!(id), do: Repo.get!(Table, id)

  @doc """
   Returns the list of tables.
  """
  def list_tables do
    Repo.all(Table)
  end

  @doc """
    Retrieve available tables for a restaurant at a give period of time
  """
  def open_tables(name, from, to) do
    restaurant = Restaurants.restaurant_by_name(name)
    if !restaurant.is_active do
      nil
    else
      Repo.all from table in Table,
        left_join: reservation in Reservation,
        on: table.id == reservation.table_id,
        where: table.restaurant_id == ^restaurant.id and
          (reservation.order_end_time < ^from or
          reservation.order_start_time > ^to or
          is_nil(reservation.order_start_time)),
        select: table
    end
  end
end
