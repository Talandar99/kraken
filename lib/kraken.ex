defmodule Kraken do
  def main([]), do: passedNoArgs()
  def main(arguments), do: passedArguments(arguments)

  defp passedNoArgs() do
    IO.puts("""

    ----🐙 KRAKEN 🐙----
          
       System helper 
        from abyss

    --------------------
        
    """)
  end

  defp passedArguments(args) do
    if hd(args) == "lurk" do
      Lurk.paruLurking(args)
    end
  end
end
