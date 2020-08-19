# Romulus

Do you live in Ancient Rome and need to add support of Roman numerals to your app?
If the answer is "Yes" then Romulus has you covered.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `romulus` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:romulus, "~> 0.1.0"}
  ]
end
```

## Conversion

To convert a numeral to it's number correspondant you use `Romulus.Numerals.to_number/1`

```elixir
iex>  Romulus.Numerals.to_number("XCLIV")
144
```
