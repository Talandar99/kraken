defmodule Kraken do
  def main([]), do: passedNoArgs()
  def main(arguments), do: passed_arguments(arguments)

  defp passedNoArgs() do
    IO.puts("""

    ---------🐙 KRAKEN 🐙----------
        
            System helper 
              from abyss
      
    -------------------------------
     lurk  - search for package
     hunt  - search and install 
             package
     call  - git stage . + commit
     awake - git configuration
    -------------------------------
     dive  - system setup:
             # nvim + dependencies
             # git + config
             # generate ssh key
    -------------------------------

    """)
  end

  defp passed_arguments(args) do
    cond do
      hd(args) == "lurk" ->
        Lurk.lurk(tl(args))

      hd(args) == "hunt" ->
        IO.puts("hunt")

      hd(args) == "call" ->
        IO.puts("call")

      hd(args) == "awake" ->
        IO.puts("awake")

      hd(args) == "dive" ->
        IO.puts("dive")

      hd(args) ->
        IO.puts("I refuse")
    end
  end
end
