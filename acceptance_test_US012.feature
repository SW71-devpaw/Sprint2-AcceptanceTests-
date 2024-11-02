Feature: Acceso de la veterinaria a la información de la mascota
    Como veterinario, 
    quiero poder acceder a la información completa de una mascota, incluyendo su historial médico, vacunas y tratamientos previos, 
    para brindar una atención adecuada durante una consulta veterinaria.

  Scenario: Acceso exitoso a la información de la mascota
    Given el veterinario está en la consulta de la mascota y necesita acceder a su información
    When ingresa al perfil de la mascota en la aplicación
    Then la aplicación muestra la información completa de la mascota, incluyendo su historial médico, vacunas, tratamientos previos y cualquier otra información relevante

    Examples:
      | veterinario | mascota | historial_medico | vacunas       | tratamientos_previos |
      | Dr. Pérez   | Luna    | Sí               | Completo      | Desparasitaciones    |
      | Dra. Gómez  | Max     | Sí               | Incompleto    | Vacuna antirrábica   |

  Scenario: Error al acceder a la información de la mascota
    Given el veterinario está en la consulta de la mascota y necesita acceder a su información
    When intenta acceder a la información pero la aplicación no puede cargarla debido a un error técnico
    Then la aplicación muestra un mensaje de error y sugiere al veterinario intentarlo más tarde o contactar con soporte técnico

    Examples:
      | veterinario | error |
      | Dr. Pérez   | 500   |
      | Dra. Gómez  | 404   |

  Scenario: Información incompleta de la mascota
    Given el veterinario está en la consulta de la mascota y necesita acceder a su información
    When accede a la información de la mascota pero encuentra que algunos datos importantes están incompletos o faltantes
    Then la aplicación muestra una alerta al veterinario indicando que la información de la mascota está incompleta y sugiere completarla lo antes posible para garantizar una atención adecuada

    Examples:
      | veterinario | mascota | campos_incompletos             |
      | Dr. Pérez   | Luna    | vacunas                        |
      | Dra. Gómez  | Max     | historial_medico, tratamientos |