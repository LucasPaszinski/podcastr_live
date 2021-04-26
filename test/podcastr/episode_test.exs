defmodule Podcastr.EpisodeTest do
  use Podcastr.DataCase

  alias Podcastr.Episode

  describe "files" do
    alias Podcastr.Episode.File

    @valid_attrs %{duration: 42, type: "some type", url: "some url"}
    @update_attrs %{duration: 43, type: "some updated type", url: "some updated url"}
    @invalid_attrs %{duration: nil, type: nil, url: nil}

    def file_fixture(attrs \\ %{}) do
      {:ok, file} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Episode.create_file()

      file
    end

    test "list_files/0 returns all files" do
      file = file_fixture()
      assert Episode.list_files() == [file]
    end

    test "get_file!/1 returns the file with given id" do
      file = file_fixture()
      assert Episode.get_file!(file.id) == file
    end

    test "create_file/1 with valid data creates a file" do
      assert {:ok, %File{} = file} = Episode.create_file(@valid_attrs)
      assert file.duration == 42
      assert file.type == "some type"
      assert file.url == "some url"
    end

    test "create_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Episode.create_file(@invalid_attrs)
    end

    test "update_file/2 with valid data updates the file" do
      file = file_fixture()
      assert {:ok, %File{} = file} = Episode.update_file(file, @update_attrs)
      assert file.duration == 43
      assert file.type == "some updated type"
      assert file.url == "some updated url"
    end

    test "update_file/2 with invalid data returns error changeset" do
      file = file_fixture()
      assert {:error, %Ecto.Changeset{}} = Episode.update_file(file, @invalid_attrs)
      assert file == Episode.get_file!(file.id)
    end

    test "delete_file/1 deletes the file" do
      file = file_fixture()
      assert {:ok, %File{}} = Episode.delete_file(file)
      assert_raise Ecto.NoResultsError, fn -> Episode.get_file!(file.id) end
    end

    test "change_file/1 returns a file changeset" do
      file = file_fixture()
      assert %Ecto.Changeset{} = Episode.change_file(file)
    end
  end

  describe "podcasts" do
    alias Podcastr.Episode.Podcast

    @valid_attrs %{members: "some members", published_at: ~N[2010-04-17 14:00:00], thumbnail: "some thumbnail", title: "some title", url: "some url"}
    @update_attrs %{members: "some updated members", published_at: ~N[2011-05-18 15:01:01], thumbnail: "some updated thumbnail", title: "some updated title", url: "some updated url"}
    @invalid_attrs %{members: nil, published_at: nil, thumbnail: nil, title: nil, url: nil}

    def podcast_fixture(attrs \\ %{}) do
      {:ok, podcast} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Episode.create_podcast()

      podcast
    end

    test "list_podcasts/0 returns all podcasts" do
      podcast = podcast_fixture()
      assert Episode.list_podcasts() == [podcast]
    end

    test "get_podcast!/1 returns the podcast with given id" do
      podcast = podcast_fixture()
      assert Episode.get_podcast!(podcast.id) == podcast
    end

    test "create_podcast/1 with valid data creates a podcast" do
      assert {:ok, %Podcast{} = podcast} = Episode.create_podcast(@valid_attrs)
      assert podcast.members == "some members"
      assert podcast.published_at == ~N[2010-04-17 14:00:00]
      assert podcast.thumbnail == "some thumbnail"
      assert podcast.title == "some title"
      assert podcast.url == "some url"
    end

    test "create_podcast/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Episode.create_podcast(@invalid_attrs)
    end

    test "update_podcast/2 with valid data updates the podcast" do
      podcast = podcast_fixture()
      assert {:ok, %Podcast{} = podcast} = Episode.update_podcast(podcast, @update_attrs)
      assert podcast.members == "some updated members"
      assert podcast.published_at == ~N[2011-05-18 15:01:01]
      assert podcast.thumbnail == "some updated thumbnail"
      assert podcast.title == "some updated title"
      assert podcast.url == "some updated url"
    end

    test "update_podcast/2 with invalid data returns error changeset" do
      podcast = podcast_fixture()
      assert {:error, %Ecto.Changeset{}} = Episode.update_podcast(podcast, @invalid_attrs)
      assert podcast == Episode.get_podcast!(podcast.id)
    end

    test "delete_podcast/1 deletes the podcast" do
      podcast = podcast_fixture()
      assert {:ok, %Podcast{}} = Episode.delete_podcast(podcast)
      assert_raise Ecto.NoResultsError, fn -> Episode.get_podcast!(podcast.id) end
    end

    test "change_podcast/1 returns a podcast changeset" do
      podcast = podcast_fixture()
      assert %Ecto.Changeset{} = Episode.change_podcast(podcast)
    end
  end
end
