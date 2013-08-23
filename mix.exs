defmodule Restclient.Mixfile do
  use Mix.Project

  def project do
    [ app: :restclient,
      version: "0.0.1",
      elixir: "~> 0.10.2-dev",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    []
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "~> 0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [{:httpotion,"0.2.0",[github: "myfreeweb/httpotion"]},
      {:json,"0.1.0",[github: "cblage/elixir-json"]}]
  end
end
