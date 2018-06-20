defmodule HomeWeatherDisplayHost do
  @moduledoc false
  use Application

  # Port on GrovePi+
  @dht_pin 7 # Use port 7 for the DHT
  @dht_poll_interval 1_000 # poll every 1 second

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the GrovePi sensor we want
      worker(GrovePi.DHT, [@dht_pin, [poll_interval: @dht_poll_interval]]),

      # Start the main app
      worker(HomeWeatherDisplayHost.Worker, [@dht_pin]),
    ]

    opts = [strategy: :rest_for_one, name: HomeWeatherDisplayHost.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defmodule Worker do
    @moduledoc false
    use GenServer
    require Logger

    defstruct [:dht]

    alias GrovePi.{RGBLCD, DHT}

    def start_link(pins) do
      GenServer.start_link(__MODULE__, pins)
    end

    def init(dht_pin) do
      state = %Worker{dht: dht_pin}

      RGBLCD.initialize()
      RGBLCD.set_text("Ready!")

      DHT.subscribe(dht_pin, :changed)
      {:ok, state}
    end

    def handle_info({_pid, :changed, %{temp: temp, humidity: humidity}}, state) do
      temp = format_temp(temp)
      humidity = format_humidity(humidity)

      #IO.puts temp
      #IO.puts humidity

      flash_rgb()

      RGBLCD.set_text(temp)
      RGBLCD.set_cursor(1, 0)
      RGBLCD.write_text(humidity)
      Logger.info temp <> " " <> humidity

      {:noreply, state}
    end

    def handle_info(_message, state) do
      {:noreply, state}
    end

    defp flash_rgb() do
      RGBLCD.set_rgb(255, 0, 0)
      Process.sleep(1000)
      RGBLCD.set_color_white()
    end

    defp format_temp(temp) do
      "Temp: #{Float.to_string(temp)} C"
    end

    defp format_humidity(humidity) do
      "Humidity: #{Float.to_string(humidity)}%"
    end

  end
end
