defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "This is a make-believe error!")
    |> render("index.html")
  end

  def show(conn, %{"id" => id}) do
    text conn, "Showing id #{id}"
  end
end