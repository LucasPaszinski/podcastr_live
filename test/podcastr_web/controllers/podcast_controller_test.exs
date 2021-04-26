defmodule PodcastrWeb.PodcastControllerTest do
  use PodcastrWeb.ConnCase

  alias Podcastr.Episode
  alias Podcastr.Episode.Podcast

  @create_attrs %{
    members: "some members",
    published_at: ~N[2010-04-17 14:00:00],
    thumbnail: "some thumbnail",
    title: "some title",
    url: "some url"
  }
  @update_attrs %{
    members: "some updated members",
    published_at: ~N[2011-05-18 15:01:01],
    thumbnail: "some updated thumbnail",
    title: "some updated title",
    url: "some updated url"
  }
  @invalid_attrs %{members: nil, published_at: nil, thumbnail: nil, title: nil, url: nil}

  def fixture(:podcast) do
    {:ok, podcast} = Episode.create_podcast(@create_attrs)
    podcast
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all podcasts", %{conn: conn} do
      conn = get(conn, Routes.podcast_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create podcast" do
    test "renders podcast when data is valid", %{conn: conn} do
      conn = post(conn, Routes.podcast_path(conn, :create), podcast: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.podcast_path(conn, :show, id))

      assert %{
               "id" => id,
               "members" => "some members",
               "published_at" => "2010-04-17T14:00:00",
               "thumbnail" => "some thumbnail",
               "title" => "some title",
               "url" => "some url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.podcast_path(conn, :create), podcast: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update podcast" do
    setup [:create_podcast]

    test "renders podcast when data is valid", %{conn: conn, podcast: %Podcast{id: id} = podcast} do
      conn = put(conn, Routes.podcast_path(conn, :update, podcast), podcast: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.podcast_path(conn, :show, id))

      assert %{
               "id" => id,
               "members" => "some updated members",
               "published_at" => "2011-05-18T15:01:01",
               "thumbnail" => "some updated thumbnail",
               "title" => "some updated title",
               "url" => "some updated url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, podcast: podcast} do
      conn = put(conn, Routes.podcast_path(conn, :update, podcast), podcast: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete podcast" do
    setup [:create_podcast]

    test "deletes chosen podcast", %{conn: conn, podcast: podcast} do
      conn = delete(conn, Routes.podcast_path(conn, :delete, podcast))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.podcast_path(conn, :show, podcast))
      end
    end
  end

  defp create_podcast(_) do
    podcast = fixture(:podcast)
    %{podcast: podcast}
  end
end
