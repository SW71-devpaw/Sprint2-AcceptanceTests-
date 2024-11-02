Feature: Subir foto de la mascota
  Como propietario de mascota,
  Quiero poder subir una foto de mi mascota a la plataforma,
  Para poder personalizar su perfil y compartir su imagen con las veterinarias.

  Scenario: Selección de Foto
    Given que estoy en la página de perfil de mi mascota
    When hago clic en el botón "Subir foto"
    Then se abre un cuadro de diálogo para seleccionar la foto desde mi dispositivo

  Scenario: Confirmación de selección de foto
    Given que he seleccionado la foto de mi mascota
    When confirmo la selección
    Then la foto se carga correctamente en el perfil de la mascota
      And se muestra en la página

  Scenario: Manejar errores de carga de foto
    Given intento subir una foto que no cumple con los requisitos de formato o tamaño
    When selecciono la foto y trato de cargarla
    Then recibo un mensaje de error indicando los requisitos de formato o tamaño
      And no se permite la carga de la foto hasta que cumpla con estos criterios

  Examples: Formatos de archivo permitidos
    | formato |
    | jpg     |
    | png     |
    | gif     |

  Examples: Tamaños de archivo permitidos
    | tamaño_maximo |
    | 5MB           |