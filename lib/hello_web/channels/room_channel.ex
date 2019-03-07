defmodule HelloWeb.RoomChannel do
  use Phoenix.Channel
  
  # room:lobby this is a public topic that anyone can join
  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  # room:<id_number> this is a private topic and will require authorization
  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    broadcast!(socket, "new_msg", %{body: body})
    {:noreply, socket}
  end
end