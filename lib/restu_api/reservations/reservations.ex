defmodule RestuAPI.Reservations do
  @moduledoc """
  The Reservations context.
  """

  import Ecto.Query, warn: false
  alias RestuAPI.Repo

  alias RestuAPI.Reservations.Reservation

  @doc """
    Creates a reservation.
  """
  def create_reservation(attrs \\ %{}) do
    %Reservation{}
    |> Reservation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
    Gets a single reservation.
    Raises `Ecto.NoResultsError` if the Reservation does not exist.
  """
  def get_reservation!(id), do: Repo.get!(Reservation, id)

  @doc """
    Returns the list of reservations.
  """
  def list_reservations do
    Repo.all(Reservation)
  end
end
