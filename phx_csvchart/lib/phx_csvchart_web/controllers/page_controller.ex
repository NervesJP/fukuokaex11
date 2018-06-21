defmodule PhxCsvchartWeb.PageController do
  use PhxCsvchartWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
