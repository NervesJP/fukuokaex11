# fukuokaex11

Elixir/Phoenix projects for [fukuoka.ex#11](https://fukuokaex.connpass.com/event/87241/)

## Project list

- examples_on_grovepi (copied from [adkron/grovepi](https://github.com/adkron/grovepi))
  - [alarm](./examples_on_grovepi/alarm)
  - [demo_rgblcd](./examples_on_grovepi/demo_rgblcd)
  - [home_weather_display](./examples_on_grovepi/home_weather_display)
  - [led_fade](./examples_on_grovepi/led_fade)
- [dht_sensor](./dht_sensor)
  - Print temparature and humidity values to IO
    - DHT for Port D7
  - Run by `$ MIX_ENV=prod iex -S mix`
- [home_weather_display_host](./home_weather_display_host)
  - Display temparature and humidity values to LCD
    - DHT for Port D7
    - LCD for I2C-1
  - Run by `$ MIX_ENV=prod iex -S mix`
- [home_weather_csv](./home_weather_csv)
  - Write temparature and humidity values to CSV (`dhtdata.csv`)
    - DHT for Port D7
    - LCD for I2C-1
  - Run by `$ iex -S mix`

- [phx_chartjs](./phx_chartjs)
  - Chart.js example on phoenix
  - Run by `$ MIX_ENV=prod mix phx.server`


## References

- GitHub repository
  - [adkron/grovepi](https://github.com/adkron/grovepi)
- Qiita article (in Japanese)
  - T.B.A

