defmodule Commands.Call do
  import IoOperations.SystemCommands.Git
  import ResultMonad

  def call(args) do
    bind({:ok, args}, &validate/1)
    |> bind(&scp/1)
  end

  def validate(args) do
    case args do
      [] ->
        {:error, ["i don't have message"]}

      [_ | []] ->
        {:ok, args}

      [_ | _] ->
        {:error, ["use \"\""]}
    end
  end
end

# commentt 
