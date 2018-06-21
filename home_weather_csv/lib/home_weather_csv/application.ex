defmodule HomeWeatherDisplayCsv.Application do
  @moduledoc false
  use Application

  # RGB LCD Screen should use the IC2-1 port
  @dht_pin 7 # Use port 7 for the DHT
  @dht_poll_interval 3_000 # poll every 3 second

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the GrovePi sensor we want
      worker(GrovePi.DHT, [@dht_pin, [poll_interval: @dht_poll_interval]]),

      # Start the main app
      worker(HomeWeatherDisplayCsv, [@dht_pin]),
    ]

    opts = [strategy: :one_for_one, name: HomeWeatherDisplayCsv.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
