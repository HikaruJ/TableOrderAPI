defmodule RestuAPI.Web.TableView do
  use RestuAPI.Web, :view
  alias RestuAPI.Web.TableView

  def render("open_tables.json", %{tables: tables}) do
    %{data: render_many(tables, TableView, "result.json")}
  end

  def render("result.json", %{table: table}) do
    %{
      assignedNumber: table.assigned_number,
      description: table.description,
      id: table.id,
      maxSeats: table.max_seats,
      minSeats: table.min_seats
    }
  end
end
