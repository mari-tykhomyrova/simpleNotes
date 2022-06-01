# SimpleNotes

## Installation
```bash
$ mix deps.get
```

## Running the app
```bash
# run development
$ mix phx.server

# run inside IEx with
$ iex -S mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Migration and Seeding

Add your credentials in `config/dev.exs`
```bash
# create and migrate database
$ mix ecto.setup

# run seeding
$ mix ecto.reset
```
