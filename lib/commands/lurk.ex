defmodule Commands.Lurk do
  def lurk(args) do
    IO.puts("Kraken is lurking for #{tl(args)}\n")
    lurking(args, "pacman")
    lurking(args, "paru")
  end

  def lurking(args, package_manager) do
    IO.puts("--------------------------------")
    IO.puts("⚓ Lurking with #{package_manager} ⚓")
    IO.puts("--------------------------------")

    System.cmd(package_manager, ["-Ss" | args])
    |> convert_output_into_IO()
  end

  def convert_output_into_IO({args, _}) do
    case args do
      "" ->
        IO.puts(IO.ANSI.green() <> "I see only darkness... \n" <> IO.ANSI.reset())
        {:error, "I see only darkness"}

      _ ->
        IO.puts(args <> "\n")
        {:ok, "i got it"}
    end
  end
end
