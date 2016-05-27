# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :imgur_upload, ImgurUpload.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "7DWz7Mir3mSjybmNk8GXdWF1J5EJ3iz92VjQRQmr5rLB4lCdzboRxOVWvbWg8pvN",
  render_errors: [accepts: ~w(html json)],
  imgur_api: %{client_id: "396a9d459163509", client_secret: "8e348e71ef32149c953a8e85b3a3f85b0a383cfc"},
  pubsub: [name: ImgurUpload.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
