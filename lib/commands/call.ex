defmodule Commands.Call do
  import IoOperations.SystemCommands.Git

  def call(args) do
    import ResultMonad

    return(args)
    |> bind(&validate_input/1)
    |> bind(&scp/1)
  end

  def validate_input(args) do
    case args do
      [] ->
        {:error, ["i don't have message"]}

      [_] ->
        {:ok, to_string(args)}

      [_ | _] ->
        {:error, ["use \"\""]}
    end
  end
end

# commentt 
