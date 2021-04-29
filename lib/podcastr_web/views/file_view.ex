defmodule PodcastrWeb.FileView do
  use PodcastrWeb, :view
  alias PodcastrWeb.FileView

  def render("index.json", %{files: files}) do
    %{data: render_many(files, FileView, "file.json")}
  end

  def render("show.json", %{file: file}) do
    %{data: render_one(file, FileView, "file.json")}
  end

  def render("file.json", %{file: file}) do
    %{id: file.id, url: file.url, type: file.type, duration: file.duration}
  end
end
