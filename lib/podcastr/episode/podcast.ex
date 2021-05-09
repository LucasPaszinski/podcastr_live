defmodule Podcastr.Episode.Podcast do
  use Ecto.Schema
  import Ecto.Changeset

  alias Podcastr.Episode.File

  schema "podcasts" do
    field :members, :string
    field :published_at, :naive_datetime
    field :description, :string
    field :thumbnail, :string
    field :title, :string
    field :url, :string
    belongs_to :file, File

    timestamps()
  end

  @doc false
  def changeset(podcast, attrs) do
    podcast
    |> cast(attrs, [:title, :url, :description, :members, :published_at, :thumbnail, :file_id])
    |> validate_required([:title, :url, :description, :members, :published_at, :thumbnail])
    |> assoc_constraint(:file)
  end
end
