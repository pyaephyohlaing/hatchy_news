defmodule HatchyNewsWeb.AuthController do
    use HatchyNewsWeb, :controller
  
    plug Ueberauth
    alias Ueberauth.Strategy.Helpers
    alias HatchyNews.Accounts.User
    alias HatchyNews.Accounts
    alias HatchyNews.Repo
    

    def callback(%{assigns: %{ueberauth_auth: auth}} = conn , %{"code" => code, "provider" => provider}) do
        identifyer = %{String.to_atom(~s[#{provider}_uid]) => ~s[#{auth.uid}]}
        user_params = %{
            email: auth.info.email,
            name: auth.info.name,
            google_uid: auth.uid
        }
        case Repo.get_by(User, identifyer) do
            nil -> 
                with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
                    conn
                    |> render(HatchyNewsWeb.UserView, "user.json", user: user)
                end
            user ->
                conn
                |> render(HatchyNewsWeb.UserView, "user.json", user: user)
        end      
     end
  end
  