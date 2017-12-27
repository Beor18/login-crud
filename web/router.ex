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

  # agregamos este bloque
  scope "/" do
    pipe_through :browser
    coherence_routes
  end

  # agregamos este bloque
  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LoginEjemplo do
    pipe_through :browser # Use the default browser stack
    resources "/posts", PostController
    get "/", PageController, :index
  end

  #Agregamos Ruta protegida /posts
  scope "/", Authexample do
    pipe_through :protected # Use the default browser stack

    resources "/posts",PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", LoginEjemplo do
  #   pipe_through :api
  # end
end
