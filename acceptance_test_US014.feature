Feature: Ver historial de citas
 Como propietario/a de la mascota,
 Quiero poder ver el historial completo de citas veterinarias de mi mascota, incluyendo fechas, horarios, propósito de la visita y cualquier otra información relevante,
 Para tener un registro completo de la atención recibida.

 Scenario: Consulta de historial de citas exitosa
   Given el Propietario/a está en la pantalla de historial de citas de la mascota
   When el Propietario/a selecciona la opción de ver historial de citas
   Then la aplicación muestra una lista completa de todas las citas veterinarias anteriores de la mascota, incluyendo fechas, horarios, propósito de la visita y cualquier otra información relevante

 Scenario: Sin citas anteriores registradas
   Given el Propietario/a está en la pantalla de historial de citas de la mascota
   When el Propietario/a no tiene citas anteriores registradas
   Then la aplicación muestra un mensaje indicando que no hay citas anteriores registradas para la mascota

 Scenario: Error al cargar historial de citas
   Given el Propietario/a está en la pantalla de historial de citas de la mascota
   When la aplicación intenta cargar el historial de citas, pero se produce un error técnico
   Then la aplicación muestra un mensaje de error
     And sugiere al Propietario/a intentarlo más tarde o contactar con soporte técnico
 
 Examples: Citas veterinarias anteriores
   | Fecha       | Hora   | Propósito de la visita | Información adicional                          |
   | 2021-01-15  | 10:00  | Vacunación             | vacuna de vitaminas                            |
   | 2021-02-20  | 11:30  | Control de peso        | Peso actual de 12.4 kg                         |
   | 2021-03-25  | 09:45  | Desparasitación        | Dosis cada 3 meses                             |
   | 2021-04-30  | 10:15  | Chequeo general        | Alimentación blanceada, falta de estimulación  |