# dotnet-travel
The library “TRAVEL” requires software to manage inventory, your mission is create an app for see the books and details per book.

## Required 

a)	.NET 5
b)	SQL Server 
c)	C#
d)	nUnit
e)	Entity Framework

## For the practical exercise, take into account the following evaluation criteria:

a)	Architecture 
b)	Structure
c)	Documentation Code
d)	Best Practices
e)	Manage Performance
f)	Unit Test 
g)	Security

## Ejecute el App con .NET en windows o linux

- descargue la versión standalone.zip del directorio raíz
- descomprima en un lugar seguro
- ingrese a la ruta de la carpeta que se creo al desempaquetar desde la consola (cmd, terminal)
- ejecute el siguiente comando $> dotnet WebTravelV1.dll 
- la aplicación le dice que ip y puerto usar para acceder a la solución
- si desea conocer a fondo como se desarrollo está solución, puede ingresar al siguiente título de Prueba Desarrollo, se requiere que tenga habilidades en desarrollo de software.

## Prueba Desarrollo

el siguiente enlace encuentra el Proyecto completo: donde podrá encontrar el uso de .NET, SqlServer, C#, Entity, las pruebas unitarias se suben a este repositorio en una carpeta llamada pruebasunitarias, se busco al máximo usar buenas prácticas, buen desempeño del producto, se usa MVC (Modelo, vista, controlador) que es un patrón de diseño de software ya ampliamente conocido y que permite mejorar las capacidades de los productos, despliegues, entre otros.

### ¿cómo hago que este proyecto funciones en mis servidores? 
que necesita para que funciones este proyecto dentro de la infraestructura de su empresa
- .NET 6, SQL Server v15, entity framework v7.0.0, C# v9, nUnit v3
- se escogió la configuración anterior porque trabajo en mi tiempo libre en un emprendimiento con realidad mixta y la maquina esta muy ajustada afinada para tal trabajo, se pueden bajar las versiones seguramente, pero es funcional y hace lo que tiene que hacer
- porque no APIRest porque esta solución se puede sacar en un contenedor de docket o gobernado por Kubernetes también esta vez deseo mostrar el uso del MVC con .NET
- en el MER se ajustó únicamente las dos llaves primarias de una entidad donde llegan libros y autores y se asignó una llave primaria para esto y sus 2 llaves foráneas correspondientes.
- tiene que mover la conexión de la base de datos que esta en appsettings.json y conectarla con los datos de su empresa, sino lo hace el app es funcional pero no tiene control apropiado sobre la infraestructura, este servicio es temporal y para uso demostratvo.
- para evitar que exista un comportamiento de duplciidad en registros de autores y libros se agrega la siguiente linea para restringuirlo (se anexa imagen de la respuesta de la excepción del servidor que evita la duplicidad):
```
ALTER TABLE [dbo].[autores_has_libros]
  ADD CONSTRAINT constraint_unique_autores_has_libros UNIQUE(autores_id, libros_ISBN);
```

Descargue la solución en .NET (esta en mi drive)
https://1drv.ms/u/s!AiS9ZpNsC0xWiRnj92XLW9hMvpW_?e=FydWpV
Si te llega a pedir una clave, escribe: Fesus?tedejaverest0k

![Imagen de inicio App Travel](https://dsm01pap005files.storage.live.com/y4m_Y1ccmO3J72JQ5na5yf5Ru3ZiNFV63ussH02yVqEU9B6IKEvAKgOaIZSMBjzj1bqt2_S0c9MCalgoaxLTBOkiOJVqcg7rxPywN-XwewTM5taNaX7Z-duyhw3VKUDQp4OO_38yOzzZ2hDIUf6FWf7xMMqYueXzIaYtDHLXuCqEIbqmJq6ZFBMyhp21WH70p6J?encodeFailures=1&width=957&height=609)

### libros y autores sin duplicdada, aquí se muestra la excepción del app
![Imagen excepción restricción autores y libros en Travel](https://raw.githubusercontent.com/fesusrocuts/dotnet-travel/master/captura-pantalla-app/Captura%20de%20pantalla_20221109_080413.png)
