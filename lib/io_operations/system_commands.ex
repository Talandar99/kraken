defmodule IoOperations.ShellCommands do
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
end
