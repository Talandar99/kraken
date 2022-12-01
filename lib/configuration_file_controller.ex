defmodule ConfigurationFileControler do
  def load_configuration() do
    (get_path() <> "kraken.conf")
    |> read_file()
    |> remove_comment_lines()
  end

  def setup_configuration() do
    get_path() |> File.mkdir_p()
    (get_path() <> "kraken.conf") |> File.write(write_conf())
  end

  defp concat_path_with_username(username) do
    "/home/" <> username <> "/.config/kraken/"
  end

  defp get_path() do
    IoOperations.ShellCommands.get_username() |> concat_path_with_username()
  end

  def read_file(filepath) do
    {_, content} = File.read(filepath)
    String.split(content, "\n")
  end

  def remove_comment_lines(args) do
    Enum.filter(args, fn x -> !String.contains?(x, "#") end)
  end

  def write_conf() do
    "#kraken configuration file\n" <>
      "awaken=true\n" <>
      "package_managers=" <> get_package_managers()
  end

  def get_package_managers() do
    l = ["paru", "pacman", "nala", "apt"]

    Enum.filter(l, fn x -> IoOperations.ShellCommands.does_tool_exist(x) end)
    |> Enum.join(",")
  end
end
