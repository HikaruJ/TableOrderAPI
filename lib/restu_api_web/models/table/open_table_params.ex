defmodule TableOrderAPI.Params.Table.OpenTable do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :from, :naive_datetime, null: false
    field :restaurant_id, :integer, null: false
    field :to, :naive_datetime, null: false
  end

  @allowed_fields ~w(from restaurant_id to)a
  @required_fields @allowed_fields

  def new_changeset(open_table, params \\ %{}) do
    open_table
    |> cast(params, @allowed_fields)
  end

  def validated_changeset(open_table, params) do
    new_changeset(open_table, params)
    |> validate_required(@required_fields)
  end
end
