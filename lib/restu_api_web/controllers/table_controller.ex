defmodule RestuAPIWeb.TableController do
  use RestuAPIWeb, :controller

  alias RestuAPI.Tables

  action_fallback RestuAPIWeb.FallbackController

  def open_tables(conn,  %{"name" => name, "from" => from, "to" => to}) do
    [{_, fromDate, _}, {_, toDate, _}] = [DateTime.from_iso8601(from), DateTime.from_iso8601(to)]
    tables = Tables.open_tables(name, fromDate, toDate)
    render(conn, "open_tables.json", tables: tables)
  end
end
