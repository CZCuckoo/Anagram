class Word < ActiveRecord::Base

    def self.find_anagrams(string)
      letters = string.split(//)
      @combinations = []
      letters.each do |letter|
        remaining = letters.select { |l| l != letter }
        @combinations << letter + remaining.join('')
        @combinations << letter + reverse_letters(remaining).join('')
      end
      @anagrams = []
      @combinations.each do |combo|
        if Word.find_by_text(combo).present?
          @anagrams << combo
        end
      end
      @anagrams
    end

    def self.reverse_letters(letters)
      # create a new array of 2 items
      length = letters.length
      reversed_letters = Array.new(length)

      # loop through letters and keep index
      letters.each_with_index do |letter, index|
        reversed_letters[length - index - 1] = letter
      end

      reversed_letters
    end

  before_create :add_letters

    def add_letters
      characters = self.text.chars
      alphabetized_characters = characters.sort
      self.letters = alphabetized_characters.join
    end

  end


#   def self.find_anagrams(string)
#     @anagrams = string.split(//)
#     @anagrams = @anagrams.permutation.map(&:join)
#   end
#
#
#   def self.find_anagrams(string)
#     # Convert word to an array of letters
#     letters = string.split(//)
#
#     # Create an array to store our anagrams
#     @combinations = []
#
#     # Loop through each letter in letters
#     letters.each do |letter|
#       # Select the remaining letters
#       remaining = letters.select { |l| l != letter }
#
#       # Create a new word by combining the letter + the remaining letters
#       # Add new word to anagrams array
#       @combinations << letter + remaining.join('')
#
#       # Create a new word by combining the letter + the reverse of the remaining letters
#       # Add new word to anagrams array
#       @combinations << letter + reverse_letters(remaining).join('')
#     end
#
#     @anagrams = []
#     @combinations.each do |combo|
#       if Word.find_by_text(combo).present?
#         @anagrams << combo
#       end
#     end
#
#     # Return anagrams array
#     @anagrams
#   end
#
#
#   # def self.find_anagrams(string)
#   #   @combinations = []
#   #   @combinations = string.split(//)
#   #   @combinations = @combinations.permutation.map(&:join)
#   #   @anagrams = []
#   #   @combinations.each do |combo|
#   #     if Word.find_by_text(combo).present?
#   #       @anagrams << combo
#   #     end
#   #   end
#   #   @anagrams
#   # end
#
#
#   def self.reverse_letters(letters)
#     # create a new array of 2 items
#     length = letters.length
#     reversed_letters = Array.new(length)
#
#     # loop through letters and keep index
#     letters.each_with_index do |letter, index|
#       reversed_letters[length - index - 1] = letter
#     end
#
#     reversed_letters
#   end
# end
