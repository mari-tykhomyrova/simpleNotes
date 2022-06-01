defmodule SimpleNotes.Repo do
  use Ecto.Repo,
    otp_app: :simpleNotes,
    adapter: Ecto.Adapters.Postgres
end
