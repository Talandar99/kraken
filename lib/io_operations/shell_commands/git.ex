defmodule IoOperations.ShellCommands.Git do
  def scp(args) do
    System.cmd("git", ["stage", "."])
    System.cmd("git", ["commit", "-m", args])
    System.cmd("git", ["push"])
  end

  def configure do
    #System.cmd("git", ["config"])

    username = IO.gets("enter username \n")
    email = IO.gets("enter email\n")

    
    IO.puts("#{String.replace(username,"\n","")} #{email}")
  end

end
