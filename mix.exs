defmodule LsEscript.MixProject do
  use Mix.Project

  def project do
    [
      app: :ls_escript,
      version: "0.1.0",
      elixir: "~> 1.11",
      releases: releases(),
      escript: escript_config(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp escript_config do
    [main_module: LsEscript]
  end

  defp releases() do
    [
      ls_escript: [
        version: "0.0.1",
        include_executables_for: [:unix],
        applications: [runtime_tools: :permanent]
      ]
    ]
  end

  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
