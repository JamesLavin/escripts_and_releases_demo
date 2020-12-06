# LsEscript

`LsEscript` is a trivial Elixir/Erlang application to demonstrate how to run an application as either an `escript` or a release.

## Releases can do everything Escripts can... and much more

This trivial repo exists to demo how easy it is to convert an Escript to an Elixir/Erlang Release.

At my current job, `escript`s are being used to run code in production, and keeping these `escript`s in sync with the version of Erlang installed on each server and on our Jenkins build server is an unnecessary headache. It also forces all Elixir/Erlang releases built on the same Jenkins server to stay pinned to the same Elixir/Erlang version installed on our servers.

I want to convince my colleagues to convert our `escript`s to Elixir/Erlang releases, into which they can compile ERTS, severing the dependency with / coupling to the server-installed Erlang. Once we do this, we'll be able to upgrade each release independently and avoid the headache of keeping our server-installed Erlang version in sync with all escripts relying on it.

### Build & run this app as an Elixir/Erlang Escript

```
mix escript.build

./ls_escript ls ..
```

### Build & run this app as an Elixir/Erlang Release

```
MIX_ENV=prod mix release ls_escript

_build/prod/rel/ls_escript/bin/ls_escript eval "LsEscript.main([\"ls\", \"..\"])"
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ls_escript` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ls_escript, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ls_escript](https://hexdocs.pm/ls_escript).
