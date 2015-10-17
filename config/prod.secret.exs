use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :hangman, Hangman.Endpoint,
  secret_key_base: "CPKi0lESu/eMTUpbJm9bMkiEOAjWkc/85SCqCIDfI2rRFJlJjAxB9PDiC8IHQPfS"

# Configure your database
config :hangman, Hangman.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "hangman_prod",
  pool_size: 20
