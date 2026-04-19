import Config

config :event_timer, EventTimerWeb.Endpoint,
  url: [host: "localhost"],
  http: [ip: {127, 0, 0, 1}, port: 4000],
  server: true,
  adapter: Bandit.PhoenixAdapter,
  live_view: [signing_salt: "event_timer_secret_salt_12345"]

config :event_timer, :app_path,
  windows:
    "C:\\Users\\USER\\Documents\\Apuntes_Elixir_Libro\\elixir-ml\\event_timer\\_build\\prod\\rel\\event_timer\\bin\\event_timer.bat"

config :logger, :console,
  format: "$time $level $message\n",
  level: :info

config :phoenix, :json_library, Jason
