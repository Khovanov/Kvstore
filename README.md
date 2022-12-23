# Kvstore

**Simple key/value store based on GenServer.**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `kvstore` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:kvstore, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/kvstore](https://hexdocs.pm/kvstore).

## Examples (IEx)

```elixir

Kvstore.put("a", 1)
Kvstore.get("a")
# > 1

Kvstore.clear
Kvstore.fetch
# > %{}

Kvstore.clear
Kvstore.put("q", 9)
Kvstore.put("x", 10)
Kvstore.fetch
# > %{"q" => 9, "x" => 10}

```

## Testing

```shell

mix test

```

## Static code analysis

```shell

mix credo

```

## Check vulnerabilities

```shell

mix deps.audit

```
