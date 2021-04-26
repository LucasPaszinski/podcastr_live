defmodule PodcastrWeb.PodcastView do
  use PodcastrWeb, :view
  alias PodcastrWeb.PodcastView

  def render("index.json", %{podcasts: podcasts}) do
    %{data: render_many(podcasts, PodcastView, "podcast.json")}
  end

  def render("show.json", %{podcast: podcast}) do
    %{data: render_one(podcast, PodcastView, "podcast.json")}
  end

  def render("podcast.json", %{podcast: podcast}) do
    %{id: podcast.id,
      title: podcast.title,
      url: podcast.url,
      members: podcast.members,
      published_at: podcast.published_at,
      thumbnail: podcast.thumbnail}
  end
end
