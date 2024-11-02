Feature: Visualizar resumen del historial médico
    Como veterinario o personal autorizado, 
    quiero poder visualizar el resumen del historial médico de cada mascota, 
    para considerar sus antecedentes durante la atención de una consulta.

  Scenario: Visualización del resumen del historial médico exitoso
    Given el usuario está autenticado como veterinario o personal autorizado
    When requiere el resumen del historial médico para atender a una mascota
    Then el sistema muestra la información relevante del historial médico de la mascota, como vacunas, cirugías y diagnósticos

    Examples:
      | mascota | historial     |
      | Luna    | Completo      |
      | Max     | Incompleto    |

  Scenario: Visualización del historial médico por fecha
    Given el usuario está autenticado como veterinario o personal autorizado
    When necesita ver el historial médico filtrado por fecha
    Then el sistema muestra el historial médico en el orden de fechas solicitado

    Examples:
      | fecha_inicio | fecha_fin |
      | 2024-01-01   | 2024-12-31|
      | 2023-06-01   | 2024-06-01|

  Scenario: Validación de fecha filtrada
    Given el usuario está autenticado como veterinario o personal autorizado
    When solicita ver el historial médico filtrado por una fecha inválida
    Then el sistema muestra un mensaje de error indicando que la fecha es incorrecta

    Examples:
      | fecha |
      | 2025-15-32 |
      | 2023-02-30 |