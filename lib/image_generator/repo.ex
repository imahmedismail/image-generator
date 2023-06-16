defmodule ImageGenerator.Repo do
  use Ecto.Repo,
    otp_app: :image_generator,
    adapter: Ecto.Adapters.Postgres
end
