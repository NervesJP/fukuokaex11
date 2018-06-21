defmodule HomeWeatherCsv.MixProject do
  use Mix.Project

  def project do
    [
      app: :home_weather_csv,
      version: "0.1.0",
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :timex],
      mod: {HomeWeatherDisplayCsv.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:timex, "~> 3.1"},
      {:grovepi, github: "adkron/grovepi", branch: "master"}
    ]
  end
end
