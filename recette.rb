# ligne très importante qui appelle les gems.
require 'http'
require 'json'
require 'dotenv'

Dotenv.load

#def converse_with_ai(api_key, conversation_history)

api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/completions"


headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}


data = { 
    #gpt-3.5-turbo-fr
    # gpt-3.5-turbo-instruct
    #babbage-002
  "model" => "babbage-002",
  "prompt" => "donne moi une rcette de",
  "max_tokens" => 50,
  "temperature" => 0.5
}


response = HTTP.post(url, headers: headers, body: data.to_json)
response_body = JSON.parse(response.body.to_s)
response_string = response_body['choices'][0]['text'].strip


puts "Hello, voici 5 nom d'annimaux :"
puts response_string