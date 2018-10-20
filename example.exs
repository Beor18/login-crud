defmodule ModuloPrueba do
    def saludar_hombre do
        obtener_hombre() |> formato_saludo() |> mostrar_saludo
    end
    
    def obtener_hombre do
        IO.gets('¿Cual es su nombre? : ')
    end

    def formato_saludo(hombre) do
        "Hola #{hombre}"
    end

    def mostrar_saludo(saludo) do
        IO.puts saludo
    end
end