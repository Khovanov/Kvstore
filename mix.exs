defmodule Kvstore.MixProject do
  use Mix.Project

  def project do
    [
      app: :kvstore,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Kvstore.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Static code analysis
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      # Security
      {:mix_audit, "~> 2.0", only: [:dev, :test], runtime: false}
    ]
  end
end
