require 'yaml'
require 'net/http'
require 'uri'
require 'json'
require_relative '../../features/helpers/generate_cards_numbers'
require_relative '../../features/helpers/validate_cards'
require_relative '../../features/helpers/data_generator'

module CreateUsersStep

  def create_user(template_file, valid_card)
    #generate data
    idc = generate_random_number(8, :integer).to_s + '1'
    name = "Tipo De Cambio#{idc}"
    cic = '000' + generate_random_number(5, :integer).to_s
    phone_number = '99' + generate_random_number(7, :integer).to_s
    uuid = 'uuid-automatedtest-' + idc
    device_token = 'automated_test_device_token' + idc
    email = "tdc#{idc}@mailinator.com"

    case valid_card
    when 'sin'
      card_number = generate_card_number('455788')
    when 'con'
      begin
        card_number = JSON.parse(generate_card_numbers)['number']
        response_body = validate_card_method(card_number)
      end until response_body.include? 'green'
    end
    #read a file template
    data = YAML.load_file("tdc_users_yml/tdc_users_templates_yml/#{template_file}")

    #replace a values
    data[0]['name'] = data[0]['name'].gsub('[name]', name)
    data[0]['idc'] = data[0]['idc'].gsub('[idc]', idc)
    data[0]['cic'] = data[0]['cic'].gsub('[cic]', cic)
    data[0]['phone_number'] = data[0]['phone_number'].gsub('[phone_number]', phone_number)
    unless data[0]['phone_number_consist'].nil?
      data[0]['phone_number_consist'] = data[0]['phone_number_consist'].gsub('[phone_number_consist]', phone_number)
    end
    data[0]['uuid'] = data[0]['uuid'].gsub('[uuid]', uuid)
    data[0]['device_token'] = data[0]['device_token'].gsub('[device_token]', device_token)
    data[0]['email'] = data[0]['email'].gsub('[email]', email)

    unless data[0]['email_consist'].nil?
      data[0]['email_consist'] = data[0]['email_consist'].gsub('[email_consist]', email)
    end

    unless data[0]['idYapeAccount'].nil?
      idYapeAccount = '993ed468868b5c359f3c973bc9fe' + rand(1000..9999).to_s
      data[0]['idYapeAccount'] = data[0]['idYapeAccount'].gsub('[idYapeAccount]', idYapeAccount)
    end

    data[0]['cards'][0]['number'] = data[0]['cards'][0]['number'].gsub('[card_number]', card_number)

    unless data[0]['cards'][0]['visa_card_token'].nil?
      visa_card_token = '70' + card_number[2..15]
      data[0]['cards'][0]['visa_card_token'] = data[0]['cards'][0]['visa_card_token'].gsub('[visa_card_token]', visa_card_token)
    end
    unless data[0]['cards'][0]['visa_card_token'].nil?
      data[0]['cards'][0]['visa_card_token'] = data[0]['cards'][0]['visa_card_token'].gsub('[visa_card_token]', card_number)
    end

    data[0]['cards'][0]['accounts'].each do |account|
      account_number_soles = '193' + generate_random_number(10, :integer).to_s
      account_number_usd = '193' + generate_random_number(10, :integer).to_s
      if account['number'].casecmp? "[account_number_soles]"
        account['number'] = account['number'].gsub('[account_number_soles]', account_number_soles)
      elsif account['number'].casecmp? "[account_number_usd]"
        account['number'] = account['number'].gsub('[account_number_usd]', account_number_usd)
      end
    end

    #print data in console
    puts data.inspect

    # Open the YAML file in write mode
    File.open("tdc_users_yml/tdc_users_generated_yml/tipo_de_cambio#{idc}.yml", 'w') do |file|
      # Write the hash to the file as YAML
      file.write(YAML.dump(data))
    end
  end

end

World(CreateUsersStep)
