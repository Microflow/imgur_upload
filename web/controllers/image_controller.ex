defmodule ImgurUpload.ImageController do
  use ImgurUpload.Web, :controller

  alias ImgurUpload.Repo
  alias ImgurUpload.Image
  require Logger

  def index(conn, _params) do
    render conn, "index.html", images: Repo.all(Image)
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"image" => %{"file" => file} }) do
    Logger.debug(inspect([file]))
    {id, url} = Image.image_upload(file)
    image = %Image{imgur_id: id, url: url, filename: file.filename}
    Repo.insert!(image)

    redirect conn, to: "/"
  end

  def index(conn, _params) do
    render conn, "index.html"
  end
end

