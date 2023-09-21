defmodule Mewsick.Repo do
  use Ecto.Repo,
    otp_app: :mewsick,
    adapter: Ecto.Adapters.Postgres
end
