defmodule PodcastrWeb.Components.Header do
  # If you generated an app with mix phx.new --live,
  # the line below would be: use MyAppWeb, :live_component
  use PodcastrWeb, :live_component

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
    "#{week_day_string(date)}, #{date.day} de #{month_string(date)} #{date.year}"
  end

  defp week_day_string(date) do
    case Date.day_of_week(date) do
      1 -> "Seg"
      2 -> "Ter"
      3 -> "Qua"
      4 -> "Qui"
      5 -> "Sex"
      6 -> "Sab"
      7 -> "Dom"
    end
  end

  defp month_string(date) do
    case date.month do
      1 -> "Janeiro"
      2 -> "Fevereiro"
      3 -> "Março"
      4 -> "Abril"
      5 -> "Maio"
      6 -> "Junho"
      7 -> "Julho"
      8 -> "Agosto"
      9 -> "Setembro"
      10 -> "Outubro"
      11 -> "Novembro"
      12 -> "Dezembro"
    end
  end
end
