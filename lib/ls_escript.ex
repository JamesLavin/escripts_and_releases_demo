defmodule LsEscript do
  @moduledoc """
  Documentation for `LsEscript`.
  """

  @doc """
  main/1 is called automatically by the escript
  """
  def main([]) do
    IO.puts("You probably should pass some parameters to ls_escript")
    IO.puts("Current OS time: " <> inspect(System.os_time()))
    IO.puts("Current OTP release: " <> inspect(System.otp_release()))
    IO.puts("Current PID: " <> inspect(System.pid()))
    IO.puts("Current directory: " <> inspect(File.cwd!()))
    IO.puts("Current files: " <> inspect(File.ls!()))
  end

  def main(["ls", dir]) do
    IO.puts("Current directory: " <> inspect(File.cwd!()))
    IO.puts("Search directory: " <> dir)
    dir = Path.expand(dir)
    {:ok, files} = File.ls(dir)
    IO.puts("Files: " <> inspect(files))
  end

  def main(args) do
    IO.puts("Main is running successfully")

    IO.puts("Received args:")

    args
    |> Enum.map(fn arg -> "  * \"#{arg}\"" end)
    |> Enum.join("\n")
    |> IO.puts()
  end
end
