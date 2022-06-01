# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SimpleNotes.Repo.insert!(%SimpleNotes.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

SimpleNotes.Repo.insert_all(
  "notes",
  [
    [text: "Go to the dentist on Wednesday", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()],
    [text: "Buy milk after work", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()],
    [text: "Stranger Things series Netflix", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()]
  ]
)
