defmodule Call do
  def call(args) do
    case args do
      [] ->
        IO.puts("I refuse")

      [args_head | []] ->
        System.cmd("git", ["stage", "."])
        System.cmd("git", ["commit", "-m", args_head])

      [_ | _] ->
        IO.puts("I refuse")
    end
  end
end

# comment 
