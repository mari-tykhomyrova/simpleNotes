defmodule SimpleNotes.NotesTest do
  use SimpleNotes.DataCase

  alias SimpleNotes.Notes

  describe "notes" do
    alias SimpleNotes.Notes

    import SimpleNotes.NotesFixtures

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert Notes.list_notes() == [note]
    end
  end
end
