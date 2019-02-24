require 'http'

# ask user to enter a word
p "Please enter a word:"
word = gets.chomp

# use wordnik API to show the words definition
definition = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

word_data = definition.parse # This is a loop you can loop through
p "#{word} can be defined as:"
i = 0
j = 1
word_data.length.times do
  word_definition = word_data[i]["text"] 
  p "#{j}. #{word_definition}"
  i += 1
  j += 1
end


# use wordnik API to show the top example of a word
top_example_data = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=")

top_example = top_example_data.parse
p "Here is the top example for the usage of the word #{word}:"
p top_example["text"]

# use wordnik API to show the pronounciation of a word
pronunciation = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=")
pronunciation_data = pronunciation.parse
how_to_pronounce = pronunciation_data[0]["raw"]
p "Here is how you pronounce the word #{word}"
p how_to_pronounce