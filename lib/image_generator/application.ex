defmodule ImageGenerator.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ImageGeneratorWeb.Telemetry,
      # Start the Ecto repository
      ImageGenerator.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ImageGenerator.PubSub},
      # Start Finch
      {Finch, name: ImageGenerator.Finch},
      # Start the Endpoint (http/https)
      ImageGeneratorWeb.Endpoint
      # Start a worker by calling: ImageGenerator.Worker.start_link(arg)
      # {ImageGenerator.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ImageGenerator.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ImageGeneratorWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
