defmodule HatchyNewsWeb.UserView do
  
    alias HatchyNewsWeb.UserView

  
    def render("user.json", %{user: user}) do
      %{
        id: user.id,
        email: user.email,
        name: user.name,
        google_uid: user.google_uid
      }
    end

  end
  