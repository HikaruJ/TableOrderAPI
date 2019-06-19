defmodule RestuAPIWeb.TableController do
  use RestuAPIWeb, :controller

  alias RestuAPI.Tables
  require IEx

  action_fallback RestuAPIWeb.FallbackController

  def open_tables(conn,  %{"name" => name, "from" => from, "to" => to}) do
    [{_, fromTime}, {_, toTime}] = [Time.from_iso8601(from), Time.from_iso8601(to)]
    tables = Tables.open_tables(name, fromTime, toTime)
    render(conn, "open_tables.json", tables: tables)
  end
end
