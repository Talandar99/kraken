defmodule ResultMonad do
  def bind(tuple, func) do
    case tuple do
      {:ok, value} ->
        func.(value)

      {:error, _} ->
        tuple

      {_, _} ->
        {:error, "unknown result"}
    end
  end

  def return(args) do
    {:ok, args}
  end
end
