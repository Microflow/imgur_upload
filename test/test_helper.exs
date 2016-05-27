ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ImgurUpload.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ImgurUpload.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ImgurUpload.Repo)

