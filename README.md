# Video Store - State machine

A video store state machine implementation

Elixir 
OTP

## States


┌────────────┐   rent      ┌──────────┐  lose ┌───────┐
│ Available  ├────────────►│  Rented  ├──────►│ Lost  │
└──────────▲─┘             └─┬────────┘       └───────┘
           │                 │
           │     return      │
           └─────────────────┘





From Book: "Seven More Languages in Seven Weeks" - 

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `states` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:states, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/states](https://hexdocs.pm/states).

