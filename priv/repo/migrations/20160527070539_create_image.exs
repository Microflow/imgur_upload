defmodule ImgurUpload.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :imgur_id, :string
      add :url, :string
      add :filename, :string

      timestamps
    end

  end
end
