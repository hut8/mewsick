defmodule Mewsick.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MewsickWeb.Telemetry,
      # Start the Ecto repository
      Mewsick.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Mewsick.PubSub},
      # Start Finch
      {Finch, name: Mewsick.Finch},
      # Start the Endpoint (http/https)
      MewsickWeb.Endpoint
      # Start a worker by calling: Mewsick.Worker.start_link(arg)
      # {Mewsick.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mewsick.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MewsickWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
