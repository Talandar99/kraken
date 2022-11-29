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
     call  - git stage all,commit
             and push
    -------------------------------
     awake - system setup:
             # git config
    -------------------------------

    """)
  end

  defp passed_arguments([args_head | args_tail]) do
    case args_head do
      "lurk" ->
        Lurk.lurk(args_tail)

      "hunt" ->
        IO.puts("hunt")

      "call" ->
        Call.call(args_tail)

      "awake" ->
        IO.puts("awake")
        IO.gets("") |> IO.puts()

      _ ->
        IO.puts("I refuse")
    end
  end
end
