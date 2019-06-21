defmodule RestuAPI.Web.Router do
  use RestuAPI.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RestuAPI.Web do
    pipe_through :api
    get "/tables/openTables", TableController, :open_tables
  end
end
