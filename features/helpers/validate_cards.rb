require 'yaml'
require 'net/http'
require 'uri'
require 'json'

module ValidateCards

  def validate_card_method (card_number)
    #check the card numbers is valid
    # Define the API endpoint
    uri = URI('https://www.dcode.fr/api/')
    # Define the data to send in the POST request
    data_api = "tool=luhn-algorithm&numbers=#{card_number}&check=true"

    # Define the headers to include in the request
    headers = { 'x-requested-with' => 'XMLHttpRequest', 'user-agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36',
                'referer' => 'https://www.dcode.fr/luhn-algorithm',
                'cookie' => '__qca=P0-1529057941-1677621214121; __gads=ID=da855275c5222501-229f4bb976b400fd:T=1677621214:S=ALNI_MYbD7dJ82p_rRbKAenTbcMUWlCeXw; _gid=GA1.2.190415702.1681930118; PHPSESSID=cd9de139e982060fec3c5497d00e49fc; __r=1.2d0ae05602d72947b069b408a5d23fe1; _ga_E506NYXE6J=GS1.1.1682016958.15.0.1682016958.0.0.0; _ga=GA1.2.38083125.1677621214; _gat_gtag_UA_647045_2=1; __gpi=UID=00000578b4f74a52:T=1677621214:RT=1682016959:S=ALNI_MaCNyrQeogxFu_EraYhiKrxRY011w; session_id=cf1bcc23-030e-4472-82c2-b38e647846b9; cto_bundle=pAz_oF9SQnplVENpaWdOMjJEMU9raFBxZjlPYTBCR3RsTSUyQmpuJTJGM3BKUyUyQkMlMkJ0NE5ycXhzUllmRXdaYTFjUE9lMUVzaTY1emZrbHJMajlRck1nOFF5M240SlAwQzVndTZpazJ4MHptaXBWcERwR0lPRkd5JTJGZkZLdkUyRjRQTmJ3Qk5OdWhwN3klMkJDWlZ4YnglMkY1TkhBQlFzdFJBSzFGd3ZKSlJvekV0JTJGbFh2THFIanBBMnJWZmV5andtN2hhNXVFc1JveGdU',
                'content-type' => 'application/x-www-form-urlencoded; charset=UTF-8',
                'Content-Length' => '<calculated when request is sent>'
    }

    # Create a new HTTP request with the headers
    request = Net::HTTP::Post.new(uri, headers)
    request.body = data_api

    # Make the request and get the response
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end

    # Print the response body
    puts response.body

    response.body
  end
end
World(ValidateCards)
