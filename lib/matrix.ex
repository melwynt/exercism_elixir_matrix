defmodule Matrix do
  import Kernel, except: [to_string: 1]
  defstruct matrix: nil

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: %Matrix{}
  def from_string(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn x -> x |> String.split(" ") end)
    |> Enum.map(fn x -> to_int(x) end)
  end

  def to_int(list_of_strings) do
    list_of_strings
    |> Enum.map(fn x -> String.to_integer(x) end)
  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  def to_string({:ok, list}), do: list |> Enum.join(" ")

  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(matrix) do
    matrix
    |> Enum.map(fn x -> x |> Enum.map(&(Kernel.to_string(&1))) end)
    |> Enum.map(fn x -> to_string({:ok, x}) end)
    |> Enum.join("\n")
  end

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(matrix), do: matrix

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(matrix, index) do
    matrix |> Enum.at(index)
  end

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(matrix) do
    0..(length(matrix)-1)
    |> Enum.map(fn x -> Enum.map(matrix, &(Enum.at(&1, x))) end)
  end

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(matrix, index) do
    matrix
    |> columns()
    |> Enum.at(index)
  end
end
