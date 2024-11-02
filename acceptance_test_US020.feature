Feature: Registrar vacunas
  Como veterinario o personal autorizado, 
  quiero poder registrar las vacunas administradas a cada mascota, 
  para mantener un historial médico completo y actualizado.

  Scenario: Registro de vacuna exitoso
    Given el usuario está autenticado como veterinario o personal autorizado
    When se administra una vacuna a una mascota
    Then se registra la vacuna en el historial médico de la mascota con los detalles correspondientes

    Examples:
      | vacuna         | fecha       | veterinario |
      | Rabia          | 2024-07-15  | Dr. Pérez   |
      | Parvovirus     | 2024-08-20  | Dra. Gómez  |
    
  Scenario: Validación de datos de vacuna
    Given el usuario está autenticado como veterinario o personal autorizado
    When intenta registrar una vacuna pero faltan datos obligatorios
    Then la aplicación muestra un mensaje de error indicando los datos faltantes y no permite el registro hasta que se completen

    Examples:
      | vacuna      | fecha       | mensaje_error              |
      | Rabia       |             | Fecha es obligatoria       |
      | Parvovirus  | 2024-08-20  | Nombre de veterinario faltante |
  
  Scenario: Actualización de vacuna existente
    Given el usuario está autenticado como veterinario o personal autorizado
    When se necesita actualizar la información de una vacuna existente
    Then el usuario puede buscar la vacuna en el historial médico de la mascota y actualizar los datos

    Examples:
      | vacuna         | fecha_antigua | fecha_nueva | veterinario_antiguo | veterinario_nuevo |
      | Rabia          | 2024-07-15    | 2024-07-16  | Dr. Pérez           | Dra. Gómez 