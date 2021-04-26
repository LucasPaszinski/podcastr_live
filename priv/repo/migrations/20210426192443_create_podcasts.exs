defmodule Podcastr.Repo.Migrations.CreatePodcasts do
  use Ecto.Migration

  def change do
    create table(:podcasts) do
      add :title, :string
      add :url, :string
      add :members, :string
      add :published_at, :naive_datetime
      add :thumbnail, :string
      add :file_id, references(:files, on_delete: :delete_all)

      timestamps()
    end

    create index(:podcasts, [:file_id])
  end
end
