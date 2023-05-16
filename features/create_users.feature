#language: en

# cucumber features/create_users.feature

Feature: Crear usuarios en archivos yml

  @Test2 @regression
  Scenario: Crear usuarios con tarjetas aleatorias (puden ser validas o no)
    Given Se crea 1 usuarios con template tdc_user_accounts.yml sin tarjetas válidas