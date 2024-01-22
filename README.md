
# IOS Recipes

Proyecto Master-Detail simple donde implementar todo lo relacionado con esta tecnología.
Necesitas un **APIKEY** de Chatgpt.

### Arquitectura
Este proyecto utiliza una Clean Architecture, busco separar la lógica en capas para mejorar la modularidad, flexibilidad y mantenibilidad.

Para la interfaz de usuario he combinado el patrón de diseño MVVM (Model-View-ViewModel).

| **Capa**              | **Función** |
| ---                   | ---       |
| **Const**             |    Centralizo todas las constantes relevantes para la aplicación en esta capa.      |
| **Data**               |    En esta capa, nos enfocamos en la manipulación de datos y la interacción con la capa de almacenamiento local y remoto. SwiftData es mi elección para la base de datos local, garantizando un almacenamiento seguro y eficiente de datos.    |
| **Entities**           |    Defino modelos específicos para la aplicación en esta capa, asegurando una representación clara y consistente de los datos.    |
| **Features**            |    Aquí se encuentra la lógica de presentación y las vistas de la aplicación.   |
| **NetworkClient**     |    Esta capa se encarga de la gestión de la comunicación con API y servicios de red.    |
| **UseCases**     |   Aquí defino los casos de uso de la aplicación, centrando la lógica de negocio.    |

## Herramientas 
Herramientas que he utilizado en esta aplicación. 

- **SwiftData:** Utilizado como sistema de base de datos local para un almacenamiento persistente y eficiente.

- **Patrón Coordinator - @EnvironmentObject:** Opté por el patrón Coordinator para la gestión de navegación y vistas, y utilicé @EnvironmentObject para inyectar dependencias de manera eficiente.

- **NavigationLink - NavigationLink** Esta herramienta simplifica la gestión de la navegación y vistas en la aplicación.

- **@Publidhed - ObservableObject:** Esencial para la gestión reactiva de datos, asegurando actualizaciones en tiempo real en la interfaz de usuario.

- [SlidingTabView](https://github.com/QuynhNguyen/SlidingTabView): Integro SlidingTabView para una barra de navegación entre vistas, proporcionando una experiencia de usuario moderna y fluida.

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

