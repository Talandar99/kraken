defmodule Call do
  def call(args) do
    validate(args)
    |> execute()
  end

  def validate(args) do
    case args do
      [] ->
        {:error, ["i don't have message"]}

      [_ | []] ->
        {:ok, args}

      [_ | _] ->
        {:error, ["use \"\" to type mutliple words"]}
    end
  end

  def execute({atom, message}) do
    case atom do
      :ok -> hd(message) |> git_scp()
      :error -> {atom, message}
    end
  end

  def git_scp(args_head) do
    System.cmd("git", ["stage", "."])
    System.cmd("git", ["commit", "-m", args_head])
    System.cmd("git", ["push"])
    {:ok, "pushed"}
  end
end

# commentt 
