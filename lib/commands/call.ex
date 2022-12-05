defmodule Commands.Call do
  import IoOperations.SystemCommands.Git

  def call(args) do
    import ResultMonad

    bind(args, &validate_input/1)
    |> bind(&scp/1)
    |> bind(&IO.puts/1)
  end

  def validate_input(args) do
    case args do
      [] ->
        {:error, ["i don't have message"]}

      [_] ->
        {:ok, args}

      [_ | _] ->
        {:error, ["use \"\""]}
    end
  end
end

# commentt 
