defmodule Podcastr.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Podcastr.Repo,
      # Start the Telemetry supervisor
      PodcastrWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Podcastr.PubSub},
      # Start the Endpoint (http/https)
      PodcastrWeb.Endpoint,
      # You can add other caches here
      {Podcastr.Cache, name: Podcastr.Episode}
      # {Podcastr.Cache, name: Podcastr.Podcast}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Podcastr.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PodcastrWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
