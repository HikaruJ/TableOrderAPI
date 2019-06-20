defmodule RestuAPI.Restaurants do
  @moduledoc """
  The Restaurants context.
  """
  import Ecto.Query, warn: false

  alias RestuAPI.Repo
  alias RestuAPI.Restaurants.Restaurant

  def create_restaurant(attrs \\ %{}) do
    %Restaurant{}
    |> Restaurant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
    Returns the list of restaurants.
  """
  def list_restaurants do
    Repo.all(Restaurant)
  end

  @doc """
    Retrieve restaurant from the restaurants table using the name of the restaurant
  """
  def restaurant_by_name(name) do
    query = from restaurant in Restaurant,
      where: fragment("lower(?)", restaurant.name) == ^name,
      select: restaurant

    Repo.one(query)
  end
end
