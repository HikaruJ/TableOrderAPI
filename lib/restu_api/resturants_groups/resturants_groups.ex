defmodule RestuAPI.ResturantsGroups do
  @moduledoc """
  The ResturantsGroups context.
  """

  import Ecto.Query, warn: false
  alias RestuAPI.Repo

  alias RestuAPI.ResturantsGroups.ResturantGroup

  @doc """
  Creates a resturant_group.
  """
  def create_resturant_group(attrs \\ %{}) do
    %ResturantGroup{}
    |> ResturantGroup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Gets a single resturant_group.
  Raises `Ecto.NoResultsError` if the Resturant group does not exist.
  """
  def get_resturant_group!(id), do: Repo.get!(ResturantGroup, id)

  @doc """
    Returns the list of resturants_groups.
  """
  def list_resturants_groups do
    Repo.all(ResturantGroup)
  end
end
