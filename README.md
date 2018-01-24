# LoginEjemplo 

![Demo](https://i.imgur.com/Kmhr4tF.png)

Para iniciar la app:

  * Instalar dependencias con `mix deps.get`
  * Crear y migrar la base de datos con `mix ecto.create && mix ecto.migrate`
  * Instalar dependencias NodeJS `npm install`
  * Iniciar servidor con `mix phoenix.server`

Visitar [`localhost:4000`](http://localhost:4000) desde el navegador.

# Actualizaciones al 24/01/2018

* Mostrar Nombre de usuario una vez logeado
* Agregado subir y mostrar imagenes
* Agregado Paginación y Buscador
* Agregado CORS
* Agregado API REST [`localhost:4000/v1/posts`](http://localhost:4000/v1/posts)
* Agregado boton cerrar sesión
* Nuevo campo en formulario (colectivos, solo para aprender como agregar campo e insertar en la BD)
* Mejoras en diseño y traducciones a español

## App /gilberto

  * Requisitos: tener instalador Ionic 3, Nodejs y SDK Android

  * Instalar `npm install`
  * Para correr en navegador `ionic serve`
  * Agregar android `ionic cordova platform add android`
  * Para correr en Android `ionic cordova run android`

## ¿Que contiene la app Gilberto?

  * Mostrar la informacion de la api rest
  * Pruebas con geolocalizacion mediante GoogleMaps
 
