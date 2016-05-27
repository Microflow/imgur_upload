defmodule ImgurUpload.ImageTest do
  use ImgurUpload.ModelCase

  alias ImgurUpload.Image

  @valid_attrs %{filename: "some content", url: "some content"}
  @invalid_attrs %{}

  require Logger

  test "image_upload works" do
    path = Path.join(__DIR__, "../../priv/static/dissectcodelogo.png")

    {id, link} = Image.image_upload(path)

    {:ok, _body} = HTTPoison.get(link)
  end

end
