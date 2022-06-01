defmodule SimpleNotesWeb.NoteLive.Index do
  use SimpleNotesWeb, :live_view

  alias SimpleNotes.Notes
  alias SimpleNotes.Notes.Note

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, notes: list_notes(), editing_note: %{id: 0, text: ""})}
  end

  @impl true
  def handle_event("create_note", %{"text" => text}, socket) do
    with {:ok, new_note} <- Notes.create_note(%{text: text}) do
      notes = get_notes(socket)
      notes = [new_note | notes]

      {:noreply, assign(socket, :notes, notes)}
    end
  end

  @impl true
  def handle_event("delete_note", %{"id" => id}, socket) do
    notes = get_notes(socket)
    note = get_note_by_id(notes, id)

    with{:ok, deleted_note} <- Notes.delete_note(note) do
      notes = filter_note(notes, deleted_note)

      {:noreply, assign(socket, :notes, notes)}
    end
  end

  @impl true
  def handle_event("get_editing_note", %{"id" => id}, socket) do
    editing_note = get_note(id)

    {:noreply, assign(socket, :editing_note, editing_note)}
  end

  @impl true
  def handle_event("update_note", %{"id" => id, "text" => text}, socket) do
    notes = get_notes(socket)
    note = get_note_by_id(notes, id)

    with {:ok, note} <- Todos.update_note(note, %{"text" => text}) do
      notes = update_note(notes, note)

      {:noreply, assign(socket, notes: notes, editing_note: %{id: 0, text: ""})}
    end
  end

  @impl true
  def handle_event("clean_editing_note", _value, socket) do
    {:noreply, assign(socket, :editing_note, %{id: 0, text: ""})}
  end

  defp filter_note(notes, deleted_note) do
    Enum.filter(notes, fn note -> note.id != deleted_note.id end)
  end

  defp get_note_by_id(notes, id) do
    Enum.find(notes, fn note -> note.id === String.to_integer(id) end)
  end

  defp update_note(notes, new_note) do
    new_notes = Enum.map(notes, fn note ->
      if note.id === new_note.id do
        new_note
      else
        note
      end
    end)

    Enum.sort(new_notes, &(&1.updated_at >= &2.updated_at))
  end

  defp get_notes(socket) do
    socket.assigns.notes
  end

  defp list_notes do
    Notes.list_notes()
  end

  defp get_note(id) do
    Notes.get_note(id)
  end
end
