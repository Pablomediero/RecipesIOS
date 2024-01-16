
# IOS Recipes

Proyecto Master-Detail simple donde implementar todo lo relacionado con esta tecnología.
Necesitas un **APIKEY** de Chatgpt.

### Arquitectura
Este proyecto utiliza una Clean Architecture, busco separar la lógica en capas para mejorar la modularidad, flexibilidad y mantenibilidad.

Para la interfaz de usuario he combinado el patrón de diseño MVVM (Model-View-ViewModel).

| **Capa**              | **Función** |
| ---                   | ---       |
| **Const**             |    Gestión de constantes.      |
| **Data**               |    Gestión de datos.    |
| **Entities**           |    Modelos de la aplicación.    |
| **Features**            |    Vistas de la aplicación.    |
| **NetworkClient**     |    Gestión de Api y servicios de red.    |
| **UseCases**     |   Definición de casos de uso.    |

## Herramientas 
Herramientas que he utilizado en esta aplicación. 

- **SwiftData:** Base de datos local.

- **Patrón Coordinator - @EnvironmentObject:** Inyector de dependencias.

- **NavigationLink - NavigationLink** Gestión de navegación y vistas.

- **@Publidhed - ObservableObject:** Gestión de datos.

- [SlidingTabView](https://github.com/QuynhNguyen/SlidingTabView): Barra de navegación entre vistas.

## Chatgpt API 

#### Ejemplo

```
  POST https://api.openai.com/v1/completions
```
#### Headers
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| Content-Type | application/json |  
| Bearer `api_key` | `string` | **Required**. Your API key |

#### Data
| Parameter | Type     |
| :-------- | :------- | 
| `model` | `string` |  
| `prompt` | `string` | 
| `max_tokens` | `int` | 
| `temperature` | `int` | 


## Autor
El feedback es vital para aprender y mejorar.

Debatir y aportar ideas permite aprender y forjarse en el camino, puedes enviarme un mensaje a mí linkedIn.
- [Pablo Mediero](https://www.linkedin.com/in/pablo-mediero-mart%C3%ADn/)

