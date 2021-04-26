defmodule Podcastr.Episode.File do
  use Ecto.Schema
  import Ecto.Changeset
  alias Podcastr.Episode.Podcast

  schema "files" do
    field :duration, :integer
    field :type, :string
    field :url, :string
    has_one :podcast, Podcast

    timestamps()
  end

  @doc false
  def changeset(file, attrs) do
    file
    |> cast(attrs, [:url, :type, :duration])
    |> validate_required([:url, :type, :duration])
  end
end
