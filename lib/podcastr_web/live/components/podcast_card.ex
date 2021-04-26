defmodule PodcastrWeb.Components.PodcastCard do
  # If you generated an app with mix phx.new --live,
  # the line below would be: use MyAppWeb, :live_component
  use PodcastrWeb, :live_component

  import Formatter, only: [month_str: 1]

  def render(assigns) do
    ~L"""
      <li>
        <img src="<%= @episode.thumbnail %>" />

        <div>
          <a href=""><%= @episode.title %> </a>
          <p> <%= @episode.members %></p>
          <span><%= format_published_at(@episode.published_at) %> </span>
        </div>

      </li>
    """
  end

  defp format_published_at(date) do
    "#{date.day} #{month_str(date)} #{date.year}"
  end
end
