defmodule IoOperations.SystemCommands.Git do
  def scp(args) do
    System.cmd("git", ["stage", "."])
    System.cmd("git", ["commit", "-m", args])
    System.cmd("git", ["push"])
  end

  def configure do
    System.cmd("git", ["config"])
  end
end
