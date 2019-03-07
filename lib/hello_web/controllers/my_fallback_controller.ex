defmodule HelloWeb.MyFallbackController do
  use HelloWeb, :controller
  
  def call(conn, error) do
    conn
    |> render(:"500")
  end
end