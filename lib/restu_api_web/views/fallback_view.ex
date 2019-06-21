defmodule RestuAPI.Web.FallbackView do
  use RestuAPI.Web, :view
  alias RestuAPI.Web.FallbackView

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
