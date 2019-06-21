defmodule TableOrderAPI.Web.Router do
  use TableOrderAPI.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TableOrderAPI.Web do
    pipe_through :api
    get "/tables/openTables", TableController, :open_tables
  end
end
