use Mix.Config
config :caesar, alphabet_size: 26
config :logger, compile_time_purge_matching: [
    [level_lower_than: :info]
  ]