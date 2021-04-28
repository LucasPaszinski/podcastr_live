defmodule PodcastrWeb.Components.PodcastTableRow do
  use PodcastrWeb, :live_component

  import Formatter, only: [month_str: 1, seconds_to_podcast_time: 1]

  def render(assigns) do
    ~L"""
      <tr>
        <td>
          <img width=120 height=120 src="<%= @episode.thumbnail %>" alt="<%= @episode.title %>" object-fit="cover"/>
        </td>
        <td>
          <a href="<%= PodcastrWeb.Endpoint.url() <> @episode.url %>" phx-click="episode-info" phx-value-slug="<%= @episode.url %>"><%= @episode.title %></a>
        </td>
        <td>
          <%= @episode.members %>
        </td>
        <td class="column-date">
          <%= format_published_at(@episode.published_at) %>
        </td>
        <td>
          <%= seconds_to_podcast_time(@episode.file.duration) %>
        </td>
        <td>
           <button type="button">
            <img src="/images/play-green.svg" alt="Tocar Episódio" />
           </button>
        </td>
      </tr>
    """
  end

  defp format_published_at(date) do
    month = date |> month_str() |> String.slice(0..2) |> String.downcase()
    year = date.year |> Integer.to_string() |> String.slice(-2..-1)
    "#{date.day} #{month} #{year}"
  end
end
