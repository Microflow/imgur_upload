use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :imgur_upload, ImgurUpload.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :imgur_upload, ImgurUpload.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "ecto",
  password: "ecto",
  database: "imgur_upload_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
