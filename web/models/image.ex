defmodule ImgurUpload.Image do
  use ImgurUpload.Web, :model

  schema "images" do
    field :imgur_id, :string
    field :url, :string
    field :filename, :string

    timestamps
  end

  @required_fields ~w(url filename)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  @imgur_url "https://api.imgur.com/3/image"

  # uploads the file and gives us a url
  # curl -F "image=@/home/minhajuddin/s/ex/imgur_upload/priv/static/dissectcodelogo.png" -X POST -H "Authorization: Client-ID 39*a**********9" https://api.imgur.com/3/image
  # TODO: validate file path
  # validate response
  # validate imgur response status code
  def image_upload(%{filename: filename, path: path}) do
    response = HTTPoison.post!(@imgur_url, {:multipart, [{:file, path, { ["form-data"], [name: "\"image\"", filename: "\"#{filename}\""]},[]}]}, %{"Authorization" => "Client-ID #{imgur_client_id}"})
    %{"data" => %{"id" => id, "link" => link}, "success" => true} = Poison.decode!(response.body)
    {id, link}
  end

  defp imgur_client_id do
    Application.get_env(:imgur_upload, ImgurUpload.Endpoint)[:imgur_api].client_id
  end
end
