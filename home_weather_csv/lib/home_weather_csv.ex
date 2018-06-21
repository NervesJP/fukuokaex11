defmodule HomeWeatherDisplayCsv do
  @moduledoc false
  use GenServer
  use Timex
  require Logger

  defstruct [:dht]

  alias GrovePi.{RGBLCD, DHT}

  def start_link(pin) do
    GenServer.start_link(__MODULE__, pin)
  end

  def init(dht_pin) do
    state = %HomeWeatherDisplayCsv{dht: dht_pin}

    RGBLCD.initialize()
    RGBLCD.set_text("Ready!")

    # Create CSV file
    File.write "dhtdata.csv", ""
    File.write "../phx_csvchart/priv/static/dhtdata.csv", ""

    DHT.subscribe(dht_pin, :changed)
    {:ok, state}
  end

  def handle_info({_pin, :changed, %{temp: temp, humidity: humidity}}, state) do
    # Get date
    #date = DateTime.utc_now() |> DateTime.to_string()
    date = Timex.now("Asia/Tokyo")
      |> Timex.format!( "%Y-%m-%d %H:%M:%S", :strftime )

    # Write data to CSV
    File.write "../dhtdata.csv", "#{date},#{temp},#{humidity}\n", [:append]
    File.write "../phx_csvchart/priv/static/dhtdata.csv", "#{date},#{temp},#{humidity}\n", [:append]

    temp = format_temp(temp)
    humidity = format_humidity(humidity)

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


