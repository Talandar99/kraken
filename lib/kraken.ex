defmodule Kraken do
  def main([]), do: passedNoArgs()
  def main(arguments), do: passed_arguments(arguments)

  defp passedNoArgs() do
    IO.puts("""



     ██╗  ██╗██████╗  █████╗ ██╗  ██╗███████╗███╗   ██╗
     ██║ ██╔╝██╔══██╗██╔══██╗██║ ██╔╝██╔════╝████╗  ██║
     █████╔╝ ██████╔╝███████║█████╔╝ █████╗  ██╔██╗ ██║
     ██╔═██╗ ██╔══██╗██╔══██║██╔═██╗ ██╔══╝  ██║╚██╗██║
     ██║  ██╗██║  ██║██║  ██║██║  ██╗███████╗██║ ╚████║
     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝
       
             🐙----------------------------🐙
         
                 System helper    
                           from abyss...
       
             🐙----------------------------🐙
               lurk  - search for package
               call  - git stage all,commit
                       and push
             🐙----------------------------🐙

    """)
  end

  defp passed_arguments([args_head | args_tail]) do
    case args_head do
      "lurk" ->
        Commands.Lurk.lurk(args_tail)

      "call" ->
        Commands.Call.call({:ok,args_tail})

      _ ->
        IO.puts("I refuse")
    end
  end
end
