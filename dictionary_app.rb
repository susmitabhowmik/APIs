require 'http'

# ask user to enter a word
p "Please enter a word:"
word = gets.chomp

# use wordnik API to show the words definition
definition = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

word_data = definition.parse
word_definition = word_data[0]["text"] 
p "Here is the definition of #{word}:"
p word_definition