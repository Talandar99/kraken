defmodule Call do
  def call(args) do
    case args do
      [] ->
        IO.puts("I refuse")

      args ->
        System.cmd("git", ["stage", "."])
        System.cmd("git", ["commit" | ["-m" | args]])
    end
  end
end
