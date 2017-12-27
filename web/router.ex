defmodule LoginEjemplo.Router do
  use LoginEjemplo.Web, :router
  
  #Enrutador Coherence: Agregar Coherence.Router nos dará acceso a las rutas que Coherence creó para nosotros.
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session #agregado
  end

  #Agregado 
  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LoginEjemplo do
    pipe_through :browser # Use the default browser stack
    resources "/posts", PostController
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", LoginEjemplo do
  #   pipe_through :api
  # end
end
