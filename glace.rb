
require 'http'
require 'json'
require 'dotenv'

Dotenv.load



api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/completions"


headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}


data = {
  "model" => "gpt-3.5-turbo-instruct",
  "prompt" => "donne moi 5 parfum de glace",
  "max_tokens" => 50,
  "temperature" => 1
}


response = HTTP.post(url, headers: headers, body: data.to_json)
response_body = JSON.parse(response.body.to_s)
response_string = response_body['choices'][0]['text'].strip


puts "Voici 5 parfums de glace :"
puts response_string