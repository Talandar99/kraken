defmodule Commands.Call do
  import IoOperations.SystemCommands.Git

  def call(args) do
    validate(args) |> execute()
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

  def execute({result, message}) do
    case result do
      :ok -> hd(message) |> scp()
      :error -> {result, message}
    end
  end
end

# commentt 
