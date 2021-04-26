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

      <footer>
        <div class="progress">
          <span>00:00</span>
          <div class="slider">
            <div class="emptySlider" >
            </div>
          </div>
          <span>00:00</span>
        </div>

        <div class="buttons">
          <button type="button">
            <img src="/images/shuffle.svg" alt="Embaralhar" />
          </button>
          <button type="button">
            <img src="/images/play-previous.svg" alt="Tocar anterior" />
          </button>
          <button type="button" class="playButton">
            <img src="/images/play.svg" alt="Tocar" />
          </button>
          <button type="button">
            <img src="/images/play-next.svg" alt="Tocar Próxima" />
          </button>
          <button type="button">
            <img src="/images/repeat.svg" alt="Repetir" />
          </button>
        </div>
      </footer>
    </div>
    """
  end
end
