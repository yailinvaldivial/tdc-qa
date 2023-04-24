require 'yaml'
require 'net/http'
require 'uri'
require 'json'
require 'faker'

module GenerateCardsNumbers
  #Genera cards validas
  def generate_card_numbers
    url = URI("https://test-backend.lambdatest.com/api/dev-tools/credit-card-generator")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true # Use SSL for secure connection

    request = Net::HTTP::Get.new(url)

    response = http.request(request)

    puts response.body
    response.body
  end

  def generate_visa_card_number
    # Generate a random 14-digit number
    number = rand(10 ** 13..10 ** 14 - 1).to_s

    # Add a "4" to the beginning to create a Visa card number
    card_number = "4" + number

    # Apply the Luhn algorithm to generate the check digit
    digits = card_number.chars.map(&:to_i)
    sum = 0
    digits.reverse.each_with_index do |digit, index|
      if index.odd?
        sum += (digit * 2 > 9 ? digit * 2 - 9 : digit * 2)
      else
        sum += digit
      end
    end
    check_digit = (10 - sum % 10) % 10

    # Add the check digit to the end of the card number
    card_number += check_digit.to_s

    # Return the valid Visa credit card number
    return card_number
  end

  def generate_card_number(bin)
    # prefix = "#{bin.to_s.rjust(6, '0')}"
    # card_number = "#{prefix}#{Faker::Number.number(digits: 10)}"
    card_number = "#{bin}#{Faker::Number.number}"
    # card_number += calculate_luhn_checksum(card_number).to_s
    card_number
  end

  def calculate_luhn_checksum(card_number)
    sum = 0
    card_number.reverse.chars.each_slice(2) do |odd, even|
      sum += odd.to_i
      double = even.to_i * 2
      double -= 9 if double >= 10
      sum += double
    end
    (10 - sum % 10) % 10
  end
end
World(GenerateCardsNumbers)
