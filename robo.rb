# pas de moi !
require 'http'
require 'json'
require 'dotenv'

Dotenv.load

def ask_question(api_key, question)
  url = "https://api.openai.com/v1/completions"

  headers = {
    "Content-Type" => "application/json",
    "Authorization" => "Bearer #{api_key}"
  }

  data = {
    "model" => "babbage-002",
    "prompt" => question,
    "max_tokens" => 500,
    "temperature" => 0.5
  }

  response = HTTP.post(url, headers: headers, body: data.to_json)
  response_body = JSON.parse(response.body.to_s)

  if response_body['choices'] && response_body['choices'][0] && response_body['choices'][0]['text']
    response_string = response_body['choices'][0]['text'].strip
    puts "Bot: #{response_string}"
  else
    puts "Erreur lors de la récupération de la réponse du bot."
  end
end

# Exemple d'utilisation
api_key = ENV["OPENAI_API_KEY"]

loop do
  print "Vous: "
  user_input = gets.chomp

  break if user_input.downcase == 'stop'

  ask_question(api_key, user_input)
end