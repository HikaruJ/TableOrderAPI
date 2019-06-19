defmodule RestuAPIWeb.Router do
  use RestuAPIWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RestuAPIWeb do
    pipe_through :api
    get "/tables/openTables", TableController, :open_tables
  end
end
