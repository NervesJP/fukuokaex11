defmodule HomeWeatherPhx.Application do
  use Application

  # RGB LCD Screen should use the IC2-1 port
  @dht_pin 7 # Use port 7 for the DHT
  @dht_poll_interval 5_000 # poll every 5 second

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(HomeWeatherPhxWeb.Endpoint, []),
      # Start your own worker by calling: HomeWeatherPhx.Worker.start_link(arg1, arg2, arg3)
      # worker(HomeWeatherPhx.Worker, [arg1, arg2, arg3]),

      # Start the GrovePi sensor we want
      worker(GrovePi.DHT, [@dht_pin, [poll_interval: @dht_poll_interval]]),

      # Start the main app
      worker(HomeWeatherPhx, [@dht_pin]),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HomeWeatherPhx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HomeWeatherPhxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
