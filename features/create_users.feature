#language: en

# cucumber -p yape_2.0_desa4 features/yape_3.0/apis_bff/tipo_cambio/api_bff_exchange_rate.feature

Feature: Crear usuarios en archivos yml

  @Test1
  Scenario: Crear usuarios con tarjetas aleatorias (puden ser validas o no)
    Given Se crea 2 usuarios con template tdc_user.yml con tarjetas valida

  @Test2 @regression
  Scenario: Crear usuarios con tarjetas aleatorias (puden ser validas o no)
    Given Se crea 5 usuarios con template tdc_user.yml sin tarjetas valida