import Config

config :event_timer, EventTimerWeb.Endpoint,
  url: [host: "localhost"],
  http: [port: System.get_env("PORT") || 4000],
  server: true,
  live_view: [signing_salt: "event_timer_secret_salt"]

config :logger, :console,
  format: "$time $level $message\n",
  level: :info

config :phoenix, :json_library, Jason
