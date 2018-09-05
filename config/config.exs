# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hatchy_news,
  ecto_repos: [HatchyNews.Repo]

# Configures the endpoint
config :hatchy_news, HatchyNewsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vm4iUthfR27xRVl387MDP7e/jrDmQOkj6xRuCsnUbSthyuRP8vKikMYzZIfKj8Tk",
  render_errors: [view: HatchyNewsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HatchyNews.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

#Ueberauth_Oauth Config
config :ueberauth, Ueberauth,
  providers: [
    google: { Ueberauth.Strategy.Google, [] }
  ]


config :ueberauth, Ueberauth.Strategy.Google.OAuth,
client_id: "532285397415-250g688gi9stt14ad8lpnsa97bkfisem.apps.googleusercontent.com",
client_secret: "3I1cfuNDUYXCddoVfT0QuH7X"
# redirect_uri: System.get_env("GOOGLE_REDIRECT_URI")