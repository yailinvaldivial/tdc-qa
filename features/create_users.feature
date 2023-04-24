#language: en

# cucumber features/create_users.feature

Feature: Crear usuarios en archivos yml

  @Test2 @regression
  Scenario: Crear usuarios con tarjetas aleatorias (puden ser validas o no)
    Given Se crea 5 usuarios con template tdc_user.yml sin tarjetas válidas