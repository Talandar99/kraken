defmodule Lurk do
  def lurk(args) do
    paruLurking(args)
  end

  def paruLurking(args) do
    IO.puts("Kraken is lurking for #{hd(args)}\n")
    IO.puts("-----{  paru  }-----\n")
    {resultParu, 0} = System.cmd("paru", ["-Ss" | tl(args)])
    IO.puts(resultParu)
    IO.puts("-----{ pacman }-----\n")
    {resultPacman, 0} = System.cmd("pacman", ["-Ss" | tl(args)])
    IO.puts("#{resultPacman} ")
    # IO.inspect(result)
  end
end
