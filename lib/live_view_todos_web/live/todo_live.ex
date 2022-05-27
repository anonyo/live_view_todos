defmodule LiveViewTodosWeb.TodoLive do
  use LiveViewTodosWeb, :live_view
  alias LiveViewTodos.Todos

  def mount(_params, _session, socket) do
    {:ok, fetch(socket)}
  end


  def handle_event("add", %{"todo" => todo}, socket) do
    Todos.create_todo(todo)

    {:no_reply, fetch(socket)}
  end

  def handle_info({Todos, [:todo | _], _}, socket) do
    {:no_reply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, todos: Todos.list_todos())
  end
end
