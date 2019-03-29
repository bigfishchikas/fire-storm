defmodule FirestormData.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: FirestormData.Worker.start_link(arg)
      # {FirestormData.Worker, arg}
      supervisor(FirestormData.Repo, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FirestormData.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
