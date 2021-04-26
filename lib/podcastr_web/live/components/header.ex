defmodule PodcastrWeb.Components.Header do
  # If you generated an app with mix phx.new --live,
  # the line below would be: use MyAppWeb, :live_component
  use PodcastrWeb, :live_component
  import Formatter, only: [day_str: 1, month_str: 1]

  def render(assigns) do
    ~L"""
    <header class="headerContainer">
      <img src="/images/logo.svg" alt="Podcastr" />

      <p>O melhor para você ouvir, sempre </p>

      <span><%= present_date(Date.utc_today()) %></span>
    </header>
    """
  end

  defp present_date(date) do
    "#{day_str(date)}, #{date.day} de #{month_str(date)} #{date.year}"
  end
end
