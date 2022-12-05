defmodule Commands.Call do
  import IoOperations.SystemCommands.Git

  def call(args) do
    import ResultMonad
    {_, value} = bind(args, &validate_input/1)
    scp(value)
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
