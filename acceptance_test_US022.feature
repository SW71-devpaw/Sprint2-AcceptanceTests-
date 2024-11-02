Feature: Registrar cirugías
    Como veterinario o personal autorizado, 
    quiero registrar un reporte de los resultados de cirugías realizadas en cada mascota, 
    para mantener un historial médico completo y actualizado.

  Scenario: Registro de reporte quirúrgico exitoso
    Given el usuario está autenticado como veterinario o personal autorizado
    When se realiza una cirugía en una mascota
    Then el usuario registra los detalles de la cirugía en el historial médico de la mascota

    Examples:
      | cirugía            | fecha       | veterinario |
      | Esterilización     | 2024-07-20  | Dr. Pérez   |
      | Extracción dental  | 2024-08-10  | Dra. Gómez  |

  Scenario: Validación de datos del reporte
    Given el usuario está autenticado como veterinario o personal autorizado
    When intenta registrar los datos de la cirugía pero faltan datos obligatorios
    Then la aplicación muestra un mensaje de error indicando los datos faltantes

    Examples:
      | cirugía          | fecha       | mensaje_error              |
      | Esterilización   |             | Fecha es obligatoria       |
      | Extracción dental| 2024-08-10  | Veterinario es obligatorio |

  Scenario: Adición de resultados de cirugía al historial médico
    Given el usuario está autenticado como veterinario o personal autorizado
    When tiene los resultados registrados de la cirugía y quiere agregarlos al historial médico
    Then la aplicación muestra una opción de añadir el registro al historial médico

    Examples:
      | cirugía            | resultado |
      | Esterilización     | Exitosa   |
      | Extracción dental  | Complicada|