require 'http'

# ask user to enter a word
p "Please enter a word:"
word = gets.chomp

# use wordnik API to show the words definition
#definition = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

# word_data = definition.parse # This is a loop you can loop through
# word_definition = word_data[0]["text"] 
# p "Here is the definition of #{word}:"
# p word_definition

# use wordnik API to show the top example of a word
example = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=")

top_example = example.parse
p "Here is the top example for the usage of the word #{word}:"
p top_example["text"]