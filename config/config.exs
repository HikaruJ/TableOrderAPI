# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :restu_api,
  namespace: RestuAPI,
  ecto_repos: [RestuAPI.Repo]

# Configures the endpoint
config :restu_api, RestuAPIWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UNp1vJWzyRbkVMlALltLI3qMqdhWmet2xw5ESgNwV24KoKlIsVJSksEAdhSfGEOf",
  render_errors: [view: RestuAPIWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: RestuAPI.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
