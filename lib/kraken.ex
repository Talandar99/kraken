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

  defp passed_arguments(args) do
    case args do
      ["lurk" | _] ->
        Lurk.lurk(tl(args))

      ["hunt" | _] ->
        IO.puts("hunt")

      ["call" | _] ->
        Call.call(tl(args))

      ["awake" | _] ->
        IO.puts("awake")
        IO.gets("") |> IO.puts()

      [_ | _] ->
        IO.puts("I refuse")
    end
  end
end
