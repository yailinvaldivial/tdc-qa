require 'selenium-webdriver'

Given(/^Navegamos por la web del generador de tarjetas (.*)$/) do |generator_web_url|

  @browser = Watir::Browser.new :safari

  case generator_web_url
  when 'namso-gen'
    url = "https://namso-gen.com/"
  end
  @browser.goto url
end