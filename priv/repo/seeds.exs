# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LoginEjemplo.Repo.insert!(%LoginEjemplo.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.

LoginEjemplo.Repo.delete_all LoginEjemplo.User

LoginEjemplo.User.changeset(%LoginEjemplo.User{}, %{name: "Fernando", email: "tecnicafly@gmail.com", password: "prueba123", password_confirmation: "prueba123"})  
|> LoginEjemplo.Repo.insert!
