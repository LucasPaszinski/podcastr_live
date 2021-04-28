defmodule PodcastrWeb.EpisodeLive do
  use PodcastrWeb, :live_view

  alias Podcastr.Episode
  alias Podcastr.Episode.Podcast

  @impl true
  def mount(%{"slug" => slug} = params, session, socket) do
    IO.inspect(params: params, session: session, socket: socket)

    case Episode.get_podcast_by_slug_url!(slug) do
      nil ->
        {:error, :not_found}

      %Podcast{} = podcast ->
        {:ok, assign(socket, episode: podcast)}
    end
  end
end
