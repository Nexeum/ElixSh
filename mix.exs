defmodule EWS.Mixfile do
  use Mix.Project

  def project do
    [
      app: :http,
      version: "0.0.1",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      extra_applications: [:logger]
      mod: { EWS, [] },
      applications: [:cowboy],
      lager: [
        handlers: [
          lager_console_backend: :info,
          lager_file_backend: [file: "error.log", level: :error],
          lager_file_backend: [file: "console.log", level: :info]
        ]
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, github: "Nexeum/SwiftCow"},
      {:mimetypes, github: "erlangpack/mimetypes"},
      {:lager, github: "Nexeum/Elogix"},
      {:shakkei, github: "Nexeum/Utilix"},
      {:jsonex, github: "Nexeum/JSXlixir"},
      {:exconfig, github: "Nexeum/XConfig"}
    ]
  end
end
