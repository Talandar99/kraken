defmodule IoOperations.ShellCommands.PackageManagers do
  def search(app_name) do
  end

  def install(app_name) do
  end

  # pick right package manager
  package_managers = %{
    :nala => %{
      :properties => [:debian_based, :need_root],
      :instal => ["nala", "install"],
      :search => ["nala", "search"]
    }
  }

  # get right command for this package manager
end
