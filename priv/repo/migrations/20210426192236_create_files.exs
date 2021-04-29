defmodule Podcastr.Repo.Migrations.CreateFiles do
  use Ecto.Migration

  def change do
    create table(:files) do
      add :url, :string
      add :type, :string
      add :duration, :integer

      timestamps()
    end
  end
end
