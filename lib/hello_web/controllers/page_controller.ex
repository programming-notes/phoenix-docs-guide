defmodule HelloWeb.PageController do
  use HelloWeb, :controller
  note = "This message is passed in using a plug. It can be overwritten!"
  plug :assign_welcome_message, note when action in [:index, :show]

  action_fallback HelloWeb.MyFallbackController

  def index(conn, %{"_format" => format}) do
    with true <- Enum.member? ["html", "text"], format do
      conn |> handle_format
    end
  end

  def index(conn, %{}) do
    conn |> handle_format
  end

  def test(conn, params) do
    render(conn, "test.html")
  end

  def show(conn, %{"id" => id}) do
    text conn, "Showing id #{id}"
  end

  defp assign_welcome_message(conn, msg) do
    assign(conn, :default_message, msg)
  end

  defp handle_format(conn) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "This is a make-believe error!")
    |> assign(:message, "Message passed in from assign")
    |> assign(:name, "Another value passed in from assign")
    |> assign(:default_message, "Original value passed in by plug was over written")
    |> render(:index)
  end
end