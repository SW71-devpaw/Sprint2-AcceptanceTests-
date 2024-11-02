Feature: Registrar enfermedades
    Como veterinario o personal autorizado, 
    quiero poder registrar las enfermedades diagnosticadas en cada mascota, 
    para mantener un historial médico completo y actualizado.

  Scenario: Registro de diagnóstico exitoso
    Given el usuario está autenticado como veterinario o personal autorizado
    When se diagnostica una enfermedad en una mascota
    Then el usuario registra los detalles del diagnóstico en el historial médico de la mascota

    Examples:
      | enfermedad      | fecha       | veterinario |
      | Parvovirus      | 2024-08-25  | Dr. Pérez   |
      | Moquillo        | 2024-09-05  | Dra. Gómez  |

  Scenario: Validación de datos de diagnóstico
    Given el usuario está autenticado como veterinario o personal autorizado
    When intenta registrar los datos del diagnóstico pero faltan datos obligatorios
    Then la aplicación muestra un mensaje de error indicando los datos faltantes

    Examples:
      | enfermedad     | fecha       | mensaje_error              |
      | Parvovirus     |             | Fecha es obligatoria       |
      | Moquillo       | 2024-09-05  | Veterinario es obligatorio |

  Scenario: Adición de diagnóstico al historial médico
    Given el usuario está autenticado como veterinario o personal autorizado
    When tiene el diagnóstico y quiere agregarlo al historial médico
    Then la aplicación muestra una opción de añadir el diagnóstico al historial médico

    Examples:
      | enfermedad    | estado       |
      | Parvovirus    | Recuperado   |
      | Moquillo      | En tratamiento |