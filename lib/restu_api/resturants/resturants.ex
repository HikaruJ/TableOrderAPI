defmodule RestuAPI.Resturants do
  @moduledoc """
  The Resturants context.
  """
  import Ecto.Query, warn: false

  alias RestuAPI.Repo
  alias RestuAPI.Resturants.Resturant

  def create_resturant(attrs \\ %{}) do
    %Resturant{}
    |> Resturant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
    Returns the list of resturants.
  """
  def list_resturants do
    Repo.all(Resturant)
  end

  @doc """
    Retrieve resturant from the resturants table using the name of the resturant
  """
  def resturant_by_name(name) do
    query = from resturant in Resturant,
      where: fragment("lower(?)", resturant.name) == ^name,
      select: resturant

    Repo.one(query)
  end
end
