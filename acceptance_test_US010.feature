Feature: Agendar una cita
 Como propietario de una mascota,
 Quiero poder agendar una cita en la clínica veterinaria a través de la aplicación,
 Para asegurar la atención médica oportuna para mi mascota.

 Scenario: Elección del veterinario
   Given el propietario de la mascota se encuentra en el perfil de una clínica veterinaria
   When presiona la opción de agendar cita
   Then le muestra un formulario para elegir la fecha y hora

 Scenario: Agendar una cita con éxito
   Given el propietario de la mascota se encuentra en el formulario para agendar una cita
   When elige una fecha y hora disponibles, selecciona el tipo de servicio necesario para su mascota y confirma la cita
   Then la cita se agenda correctamente
     And se muestra un mensaje de confirmación

 Scenario: Selección de fecha y hora no disponible
   Given el propietario de una mascota se encuentra en la sección de citas
   When intenta agendar una cita en una fecha que no está disponible
   Then se muestra un mensaje indicando que no hay horarios disponibles en esa fecha
     And se le sugiere seleccionar una fecha alternativa

 Examples: Tipos de servicios
   | servicio |
   | Consulta general |
   | Cirugía |
   | Vacunación |
   | Emergencia |

 Examples: Veterinarios disponibles
   | Nombre     | Apellido  | Especialidad |
   | Juan       | Pérez     | Cirugía      |
   | María      | Gómez     | Vacunación   |
   | Carlos     | López     | Emergencia   |

 Examples: Elegir Fecha y hora
   |Fecha      |Hora      |
   |2024-10-01 |10:00     |
   |2024-11-12 |11:00     |    