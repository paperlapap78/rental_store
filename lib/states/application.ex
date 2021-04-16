defmodule States.Application do
  use Application

  def start(_type, videos) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised (worker hides boiler plate)
      worker(States.Server, [videos])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: States.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
