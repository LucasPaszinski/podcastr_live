defmodule PodcastrWeb.EpisodeLive do
  use PodcastrWeb, :live_view

  alias Podcastr.Episode

  @impl true
  def mount(%{"slug" => slug}, session, socket) do
    {:ok, assign(socket, episode: Episode.get_podcast_by_slug_url(slug))}
  end
end
