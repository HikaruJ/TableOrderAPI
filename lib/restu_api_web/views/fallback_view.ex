defmodule RestuAPIWeb.FallbackView do
  use RestuAPIWeb, :view
  alias RestuAPIWeb.FallbackView

  def render("404.json", %{error: error}) do
    %{data: render_one(error, FallbackView, "result.json")}
  end

  def render("result.json", %{error: error}) do
    %{
      error: error,
      status: 404
    }
  end
end
