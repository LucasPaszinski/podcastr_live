defmodule PodcastrWeb.PageLive do
  use PodcastrWeb, :live_view

  alias Podcastr.Episode

  @impl true
  def mount(_params, _session, socket) do
    case Episode.list_episodes() do
      [latest_episode1, latest_episode2 | episodes] ->
        latest_eps = [latest_episode1, latest_episode2]
        {:ok, assign(socket, latest_episodes: latest_eps, episodes: episodes)}

      otherwise ->
        {:ok, assign(socket, latest_episodes: otherwise, episodes: [])}
    end
  end

  @impl true
  def handle_event("episode-info", %{"slug" => slug}, socket) do
    redirect_socket =
      socket
      |> push_redirect(to: "/episodes/#{slug}")

    {:noreply, redirect_socket}
  end
end
