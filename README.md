# LoginEjemplo 

![Demo](https://i.imgur.com/Kmhr4tF.png)

Para iniciar la app:

  * Instalar dependencias con `mix deps.get`
  * Crear y migrar la base de datos con `mix ecto.create && mix ecto.migrate`
  * Instalar dependencias NodeJS `npm install`
  * Iniciar servidor con `mix phoenix.server`

Visitar [`localhost:4000`](http://localhost:4000) desde el navegador.

# Actualizaciones al 09/01/2018

* Agregado subir y mostrar imagenes
* Agregado Paginación y Buscador
* Agregado CORS
* Agregado API REST [`localhost:4000/v1/posts`](http://localhost:4000/v1/posts)
* Agregado boton cerrar sesión
* Nuevo campo en formulario (colectivos, solo para aprender como agregar campo e insertar en la BD)
* Mejoras en diseño y traducciones a español

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
