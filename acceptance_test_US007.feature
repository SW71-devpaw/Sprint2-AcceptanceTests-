Feature: Ver listado de mis mascotas
  Como propietario de una mascota, 
  quiero poder ver un listado de todas mis mascotas registradas en la aplicación 
  para tener un acceso rápido a su información y gestionarlas de manera eficiente.

  Scenario: Listado de mascotas
    Given el propietario de la mascota se encuentra en la pantalla inicial de la aplicación
    When navega a la sección de "Mis Mascotas"
    Then se muestra un listado de todas sus mascotas registradas, incluyendo su nombre y foto

    Examples:
      | usuario  | mascotas                          |
      | Carlos   | Luna, Max, Rocky                  |
      | Ana      | Bella, Simba                      |

  Scenario: Usuario sin mascotas registradas
    Given el propietario de la mascota se encuentra en la pantalla inicial de la aplicación
    When intenta acceder al listado de sus mascotas
    Then el sistema muestra un mensaje indicando que no tiene mascotas registradas

    Examples:
      | usuario  |
      | Luis     |
      | Marta    |

  Scenario: Detalles de mascota seleccionada
    Given el propietario de la mascota se encuentra en la pantalla de “Mis Mascotas”
    When selecciona una mascota del listado
    Then se muestra una pantalla con los detalles completos de la mascota, incluyendo su nombre, foto, especie, raza, edad, entre otros datos importantes

    Examples:
      | mascota | especie | raza         | edad | foto      |
      | Luna    | perro   | labrador     | 3    | img_luna  |
      | Bella   | gato    | siames       | 2    | img_bella | 