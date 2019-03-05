defmodule HelloWeb.MyFallbackController do
  use HelloWeb, :controller
  
  def call(conn, error) do
    conn
    |> put_status(422)
    |> put_view(HelloWeb.ErrorView)
    |> render(conn)
  end
end