defmodule Exmd.MixProject do
  use Mix.Project

  def project do
    [
      app: :exmd,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      escript: escript(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def escript do
    [main_module: Exmd.CLI]
  end

  defp deps do
    [
      {:httpotion, "~> 3.1.0"}
    ]
  end
end
