defmodule TableOrderAPI.Web.TableController do
  use Timex
  use TableOrderAPI.Web, :controller
  alias TableOrderAPI.Params.Table.OpenTable
  alias TableOrderAPI.Tables
  
  action_fallback TableOrderAPI.Web.FallbackController

  ### Public Methods ###
  
  def open_tables(conn,  params) do
    changeset = OpenTable.validated_changeset(%OpenTable{}, params)
    if !changeset.valid? do
      conn
        |> put_status(:not_found)
        |> json(%{error: TableOrderAPI.Web.ChangesetView.translate_errors(changeset)})
    else
      [from_date, {restaurant_id, _}, to_date] = parse_open_table_params(params)
      tables = Tables.open_tables(from_date, restaurant_id, to_date)
      render(conn, "open_tables.json", tables: tables)
    end
  end
  
  ### Private Methods ###
  
  defp parse_open_table_params(params) do
    { from, restaurant_id, to } = { Map.get(params, "from"), Map.get(params, "restaurant_id"), Map.get(params, "to") }
    [to_utc(from), Integer.parse(restaurant_id), to_utc(to)]
  end
  
  defp to_utc(date_str) do
    {_, date, _} = DateTime.from_iso8601(date_str)
    Timex.to_datetime(date, "Etc/UTC")
  end
end
