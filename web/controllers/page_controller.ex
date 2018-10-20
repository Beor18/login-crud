defmodule LoginEjemplo.PageController do
  use LoginEjemplo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
