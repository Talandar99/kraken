defmodule ConfigurationFileControler do
  def load_configuration() do
    (get_path() <> "kraken.conf")
    |> read_file()
    |> remove_comment_lines()
  end

  def setup_configuration() do
    get_path() |> File.mkdir_p()
    # (get_path() <> "config.toml") |> File.write(args)
  end

  defp get_path() do
    get_username() |> concat_path_with_username()
  end

  defp get_username() do
    {username, _} = System.cmd("whoami", [])
    String.replace(username, "\n", "")
  end

  defp concat_path_with_username(username) do
    "/home/" <> username <> "/.config/kraken/"
  end

  def read_file(filepath) do
    {_, content} = File.read(filepath)
    String.split(content, "\n")
  end

  def remove_comment_lines(args) do
    Enum.filter(args, fn x -> !String.contains?(x, "#") end)
  end

  def write_conf_file() do
    "#kraken configuration file\n" <>
      "awaken=true\n" <>
      "package_managers=" <> get_package_managers()
  end

  def get_package_managers() do
    l = ["paru", "pacman", "nala", "apt"]

    Enum.filter(l, fn x -> is_tool_installed(x) end)
    |> Enum.join(",")
  end

  def is_tool_installed(tool_name) do
    {response, _} = System.cmd("which", [tool_name])

    case response do
      "" -> false
      _ -> true
    end
  end
end
