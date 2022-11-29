defmodule Git do
  def scp([args_head | _]) do
    System.cmd("git", ["stage", "."])
    System.cmd("git", ["commit", "-m", args_head])
    System.cmd("git", ["push"])
  end

  def configure do
    System.cmd("git", ["config"])
  end
end
