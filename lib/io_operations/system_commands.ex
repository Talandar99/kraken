defmodule IoOperations.SystemCommands do
  def get_username do
    {username, _} = System.cmd("whoami", [])
    String.replace(username, "\n", "")
  end

  def does_tool_exist(tool_name) do
    {response, _} = System.cmd("which", [tool_name])

    case response do
      "" -> false
      _ -> true
    end
  end

  def confirm(message) do
    input =
      IO.gets(message <> "\ny/n\n")
      |> String.downcase()
      |> String.replace(" ", "")
      |> String.replace("\n", "")

    case input do
      "y" -> true
      "n" -> false
      _ -> confirm(message)
    end
  end
end
