defmodule PodcastrWeb.PodcastController do
  use PodcastrWeb, :controller

  alias Podcastr.Episode
  alias Podcastr.Episode.Podcast

  action_fallback PodcastrWeb.FallbackController

  def index(conn, _params) do
    podcasts = Episode.list_podcasts()
    render(conn, "index.json", podcasts: podcasts)
  end

  def create(conn, %{"episodes" => podcast_params}) do
    with {:ok, %Podcast{} = podcast} <- Episode.create_podcast(podcast_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.podcast_path(conn, :show, podcast))
      |> render("show.json", podcast: podcast)
    end
  end

  def show(conn, %{"id" => id}) do
    podcast = Episode.get_podcast!(id)
    render(conn, "show.json", podcast: podcast)
  end

  def update(conn, %{"id" => id, "podcast" => podcast_params}) do
    podcast = Episode.get_podcast!(id)

    with {:ok, %Podcast{} = podcast} <- Episode.update_podcast(podcast, podcast_params) do
      render(conn, "show.json", podcast: podcast)
    end
  end

  def delete(conn, %{"id" => id}) do
    podcast = Episode.get_podcast!(id)

    with {:ok, %Podcast{}} <- Episode.delete_podcast(podcast) do
      send_resp(conn, :no_content, "")
    end
  end
end
