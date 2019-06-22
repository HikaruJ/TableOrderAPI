defmodule TableOrderAPI.Web.TableView do
  use TableOrderAPI.Web, :view
  alias TableOrderAPI.Web.TableView

  def render("open_tables.json", %{tables: tables}) do
    %{data: render_many(tables, TableView, "result.json")}
  end

  def render("result.json", %{table: table}) do
    %{
      assignedNumber: table.assigned_number,
      description: table.description,
      maxSeats: table.max_seats,
      minSeats: table.min_seats
    }
  end
end
