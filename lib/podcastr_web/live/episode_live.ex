defmodule PodcastrWeb.EpisodeLive do
  use PodcastrWeb, :live_view

  alias Podcastr.Episode

  @impl true
  def mount(%{"slug" => slug}, _session, socket) do
    {:ok, assign(socket, episode: Episode.get_podcast_by_slug_url(slug))}
  end

  @impl true
  def handle_event("back", _, socket) do
    {:noreply, push_redirect(socket, to: Routes.page_path(socket, :index))}
  end
end
