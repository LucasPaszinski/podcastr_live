defmodule PodcastrWeb.Components.Player do
  # If you generated an app with mix phx.new --live,
  # the line below would be: use MyAppWeb, :live_component
  use PodcastrWeb, :live_component

  def render(assigns) do
    ~L"""
    <div class="playerContainer">
      <header>
        <img src="/images/playing.svg" alt="Tocando Agora" />

        <strong>Tocando agora</strong>
      </header>

      <div class="emptyPlayer">
        <strong>Selecione um podcast para ouvir</strong>
      </div>
    </div>
    """
  end
end
