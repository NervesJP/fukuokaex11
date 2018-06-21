# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :home_weather_phx,
  ecto_repos: [HomeWeatherPhx.Repo]

# Configures the endpoint
config :home_weather_phx, HomeWeatherPhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8mZ7Vngi2RbNiLYwYks1AObXZRZV8IYF5HeUHV2XfbYQW7q9D6u5VQZ2Rt2CNtKY",
  render_errors: [view: HomeWeatherPhxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HomeWeatherPhx.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
