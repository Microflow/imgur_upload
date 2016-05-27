defmodule ImgurUpload.PageController do
  use ImgurUpload.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
