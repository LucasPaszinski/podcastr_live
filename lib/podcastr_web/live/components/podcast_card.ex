defmodule PodcastrWeb.Components.PodcastCard do
  # If you generated an app with mix phx.new --live,
  # the line below would be: use MyAppWeb, :live_component
  use PodcastrWeb, :live_component

  import Formatter, only: [month_str: 1, seconds_to_podcast_time: 1]

  def render(assigns) do
    ~L"""
      <li class="podcast-card">
        <img class="banner" width="192" height="192" src="<%= @episode.thumbnail %>" />

        <div class="episode-details">
          <a
            phx-click="episode-info"
            phx-value-slug="<%= @episode.url %>"
            phx-value-episode="<%= @episode.id %>">
              <%= @episode.title %>
          </a>
          <p> <%= @episode.members %></p>
          <span><%= format_published_at(@episode.published_at) %> </span>
          <span><%= seconds_to_podcast_time(@episode.file.duration) %> </span>
        </div>

        <button type="button">
          <img src="/images/play-green.svg" alt="Tocar Episódio"/>
        </button>
      </li>
    """
  end

  defp format_published_at(date) do
    month = date |> month_str() |> String.slice(0..2) |> String.downcase()
    year = date.year |> Integer.to_string() |> String.slice(-2..-1)
    "#{date.day} #{month} #{year}"
  end
end
