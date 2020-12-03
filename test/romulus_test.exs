defmodule RomulusTest do
  use ExUnit.Case
  doctest Romulus

  alias Romulus.Numerals

  test "Convert numeral to number" do
    assert Numerals.to_number("MCMXCIX") == 1999
    assert Numerals.to_number("MDCLXXXIV") == 1684
  end

  test "Fail if character is repeated more than 3 times" do
    assert Numerals.to_number("IIII") == {:error, "Characters can't repeat more than 3 times"}
  end

  test "Fail if invalid characters exist" do
    assert Numerals.to_number("ACMX") == {:error, "Invalid characters"}
  end
end
