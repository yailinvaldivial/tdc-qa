#language: en

# cucumber features/create_users_valid_card.feature

Feature: Crear usuarios en archivos yml con tarjeta de credito valida

  @Test1
  Scenario: Crear usuarios con tarjetas aleatorias validas
    Given Navegamos por la web del generador de tarjetas namso-gen
    And Se crea 2 usuarios con template tdc_user.yml con tarjetas válidas