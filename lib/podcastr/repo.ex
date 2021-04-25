defmodule Podcastr.Repo do
  use Ecto.Repo,
    otp_app: :podcastr,
    adapter: Ecto.Adapters.Postgres
end
