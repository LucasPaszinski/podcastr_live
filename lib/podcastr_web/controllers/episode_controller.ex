defmodule PodcastrWeb.EpisodeController do
  use PodcastrWeb, :controller

  alias Podcastr.Episode

  action_fallback PodcastrWeb.FallbackController

  def create(conn, %{"episodes" => episodes_params}) do
    with {:ok, _} <- Episode.create_episodes(episodes_params) do
      conn
      |> put_status(200)
      |> json(%{message: "Ok!"})
    end
  end
end
