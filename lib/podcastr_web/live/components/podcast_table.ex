defmodule PodcastrWeb.Components.PodcastTable do
  # If you generated an app with mix phx.new --live,
  # the line below would be: use MyAppWeb, :live_component
  use PodcastrWeb, :live_component

  import Formatter, only: [month_str: 1, seconds_to_podcast_time: 1]

  def render(assigns) do
    ~L"""
      <table cellspacing =0 >
        <thead>
          <th></th>
          <th>Podcast</th>
          <th>Integrantes</th>
          <th>Data</th>
          <th>Duração</th>
          <th></th>
        </thead>
        <tbody>
          <%= for episode <- @episodes do %>
            <%= live_component @socket, PodcastrWeb.Components.PodcastTableRow, key: episode.id, episode: episode %>
          <%end%>
        </tbody>
      </table>
    """
  end
end
