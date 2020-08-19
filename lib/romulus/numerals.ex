defmodule Romulus.Numerals do
  @moduledoc """
  Roman numerals conversion functions
  """

  @doc """
  Converts a numeral to its number correspondant
  """
  @spec to_number(String.t()) :: integer()
  def to_number("") do
    nil
  end

  def to_number(numerals) do
    %{valid?: true, numerals: String.upcase(numerals), error: nil}
    |> validate_numeral()
    |> convert()
  end

  @spec validate_numeral(map) :: map
  defp validate_numeral(%{numerals: numerals} = conversion) do
    cond do
      Regex.match?(~r/[^MCLXVI]/, numerals) ->
        %{conversion | valid?: false, error: "Invalid characters"}

      Regex.match?(~r/([MCLXVI])\1{3,}/, numerals) ->
        %{conversion | valid?: false, error: "Characters can't repeat more than 3 times"}

      true ->
        conversion
    end
  end

  defp convert(%{valid?: false, error: error}) do
    {:error, error}
  end

  defp convert(%{numerals: numerals}) do
    numerals
    |> String.codepoints()
    |> Enum.reduce([], fn
      numeral, [] ->
        [int_value(numeral)]

      numeral, [last | rest] = acc ->
        value = int_value(numeral)

        case value > last do
          true ->
            [value - last | rest]

          _ ->
            [value | acc]
        end
    end)
    |> Enum.sum()
  end

  @spec int_value(String.t()) :: integer()
  defp int_value("M"), do: 1000
  defp int_value("C"), do: 100
  defp int_value("L"), do: 50
  defp int_value("X"), do: 10
  defp int_value("V"), do: 5
  defp int_value("I"), do: 1
end
