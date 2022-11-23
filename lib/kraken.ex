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
     dive into abyss 
           - system setup:
             # nvim + dependencies
             # git + config
             # generate ssh key
    -------------------------------

    """)
  end

  defp passed_arguments(args) do
    if hd(args) == "lurk" do
      Lurk.lurk(args)
    end
  end
end
