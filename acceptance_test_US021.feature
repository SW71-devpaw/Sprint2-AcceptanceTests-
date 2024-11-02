Feature: Registrar resultados de análisis
    Como veterinario o personal autorizado, quiero poder registrar los resultados de análisis obtenidos de cada mascota, para mantener un historial médico completo y actualizado.

  Scenario: Registro de resultados exitoso
    Given el usuario está autenticado como veterinario o personal autorizado
    When se obtienen los resultados de análisis de una mascota
    Then el usuario registra los datos del resultado en el historial médico de la mascota

    Examples:
      | análisis           | resultado     | fecha       | veterinario |
      | Hemograma          | Normal        | 2024-09-10  | Dr. Pérez   |
      | Bioquímica         | Anormal       | 2024-09-15  | Dra. Gómez  |

  Scenario: Validación de datos de resultados
    Given el usuario está autenticado como veterinario o personal autorizado
    When intenta registrar los resultados pero faltan datos obligatorios
    Then la aplicación muestra un mensaje de error indicando los datos faltantes

    Examples:
      | análisis       | resultado | fecha       | mensaje_error             |
      | Hemograma      |           | 2024-09-10  | Resultado es obligatorio  |
      | Bioquímica     | Anormal   |             | Fecha es obligatoria      |
    
  Scenario: Adición de resultados al historial médico
    Given el usuario está autenticado como veterinario o personal autorizado
    When tiene los resultados registrados y quiere agregarlos al historial médico
    Then la aplicación muestra una opción de añadir el registro de resultados al historial médico del paciente

    Examples:
      | análisis     | resultado |
      | Hemograma    | Normal    |
      | Bioquímica   | Anormal   |
